import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';
import '../app_colors.dart';
import '../../core/app_constants.dart';
import '../../core/app_strings.dart';
import '../../services/remote_config_service.dart';
import '../../services/update_service.dart';

class UpdateDialog extends StatefulWidget {
  final bool isMandatory;
  final String? newVersion;
  final String whatsNew;
  final String? downloadUrl;
  final AppBlockState? blockState;

  const UpdateDialog({
    super.key,
    this.isMandatory = false,
    this.newVersion,
    required this.whatsNew,
    this.downloadUrl,
    this.blockState,
  });

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  String _downloadStatus = '';
  String _errorMessage = '';
  late String _releaseNotes;

  @override
  void initState() {
    super.initState();
    _releaseNotes = widget.whatsNew;
    _fetchRealReleaseNotes();
  }

  Future<void> _fetchRealReleaseNotes() async {
    // Only fetch if this is a mandatory update triggered by Remote Config
    if (widget.blockState != null &&
        widget.blockState!.isMaintenance == false) {
      final notes = await UpdateService.getAggregatedReleaseNotes();
      if (notes != null && notes.isNotEmpty && mounted) {
        setState(() {
          _releaseNotes = notes;
        });
      }
    }
  }

  Future<void> _launchUpdateUrlFallback() async {
    final String fallbackStr =
        widget.blockState?.updateUrl ??
        widget.downloadUrl ??
        AppConstants.websiteUrl;
    final Uri url = Uri.parse(fallbackStr);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (_) {
      // Last-resort fallback; the main download path already surfaced an error.
    }
  }

  Future<void> _handleUpdate() async {
    const isStoreRelease = bool.fromEnvironment(
      'STORE_RELEASE',
      defaultValue: false,
    );

    if (isStoreRelease) {
      // For Microsoft Store, we must launch the store link.
      final String storeUrl =
          widget.blockState?.updateUrl ??
          widget.downloadUrl ??
          AppConstants.storeUpdateUrl;
      if (storeUrl.isNotEmpty) {
        final url = Uri.parse(storeUrl);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      }
      return;
    }

    setState(() {
      _isDownloading = true;
      _errorMessage = '';
      _downloadProgress = 0.0;
      _downloadStatus = 'Starting download...';
    });

    final client = http.Client();
    IOSink? openSink;

    try {
      String? actualDownloadUrl =
          widget.downloadUrl ?? widget.blockState?.updateUrl;

      // If we don't have a direct .exe URL, we fetch it from the GitHub API
      if (actualDownloadUrl == null ||
          !actualDownloadUrl.toLowerCase().endsWith('.exe')) {
        setState(() {
          _downloadStatus = 'Fetching update information...';
        });
        actualDownloadUrl = await UpdateService.getLatestDownloadUrl();
        if (actualDownloadUrl == null || actualDownloadUrl.isEmpty) {
          throw Exception('Could not find the latest update file on GitHub.');
        }
      }

      setState(() {
        _downloadStatus = 'Downloading update...';
      });

      final request = http.Request('GET', Uri.parse(actualDownloadUrl));

      final http.StreamedResponse response = await client.send(request);
      if (response.statusCode != 200) {
        throw Exception('Download failed with status: ${response.statusCode}');
      }

      final contentLength = response.contentLength;
      final Directory tempDir = await getTemporaryDirectory();

      // Clean up previous Shrinkeo update installers only — never touch
      // unrelated executables living in the shared OS temp directory.
      try {
        final List<FileSystemEntity> entities = tempDir.listSync();
        for (final entity in entities) {
          if (entity is File &&
              entity.path.toLowerCase().endsWith('.exe') &&
              p.basename(entity.path).toLowerCase().contains('shrinkeo')) {
            entity.deleteSync();
          }
        }
      } catch (_) {
        // Best-effort cleanup; leftover installers are harmless.
      }

      final String fileName = actualDownloadUrl.split('/').last;
      final File file = File(p.join(tempDir.path, fileName));
      final IOSink sink = file.openWrite();
      openSink = sink;

      int downloaded = 0;
      double lastEmittedFraction = 0.0;
      DateTime lastEmitTime = DateTime.now();

      await for (final chunk in response.stream) {
        sink.add(chunk);
        downloaded += chunk.length;

        // Throttle UI updates: only rebuild on a >=1% step or >=100 ms.
        final now = DateTime.now();
        final fraction = contentLength != null && contentLength > 0
            ? downloaded / contentLength
            : null;
        final shouldEmit = fraction == null
            ? now.difference(lastEmitTime).inMilliseconds >= 100
            : (fraction - lastEmittedFraction).abs() >= 0.01 ||
                  now.difference(lastEmitTime).inMilliseconds >= 100;
        if (!shouldEmit || !mounted) continue;
        lastEmittedFraction = fraction ?? lastEmittedFraction;
        lastEmitTime = now;

        setState(() {
          final String downloadedMb = (downloaded / (1024 * 1024))
              .toStringAsFixed(1);
          if (fraction != null) {
            _downloadProgress = fraction;
            // fraction != null guarantees contentLength != null && > 0.
            final String totalMb = (contentLength! / (1024 * 1024))
                .toStringAsFixed(1);
            _downloadStatus = '$downloadedMb MB / $totalMb MB';
          } else {
            _downloadStatus = '$downloadedMb MB downloaded';
          }
        });
      }

      await sink.flush();
      await sink.close();
      openSink = null;
      client.close();

      if (mounted) {
        setState(() {
          _downloadStatus = 'Installing...';
          _downloadProgress = 1.0;
        });
      }

      if (Platform.isWindows) {
        await Process.start(file.path, []);
        exit(0);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isDownloading = false;
          _errorMessage = AppStrings.failedDownloadUpdateMsg;
        });
      }
    } finally {
      // Guarantee the sink and HTTP client are released on any failure
      // (mid-stream errors, cancellation, etc.). Double-close is harmless.
      if (openSink != null) {
        try {
          await openSink.close();
        } catch (_) {
          // Sink already closed or disk error; nothing more to do.
        }
      }
      client.close();
    }
  }

  void _onLaterPressed() {
    if (!widget.isMandatory) {
      Navigator.of(context).pop();
      return;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color warningRed = isDark
        ? const Color(0xFFEF5350)
        : AppColors.errorRed;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: warningRed),
              const SizedBox(width: 8),
              Text(AppStrings.skipUpdateConfirmTitle),
            ],
          ),
          content: SizedBox(
            width: 400,
            child: Text(
              AppStrings.skipUpdateConfirmDesc,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close confirm dialog
              },
              child: Text(
                AppStrings.skipUpdateCancelBtn,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close confirm dialog
                RemoteConfigService.bypassBlock(); // Unblock the app
              },
              child: Text(
                AppStrings.skipUpdateConfirmBtn,
                style: TextStyle(
                  color: warningRed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    Widget dialogContent = Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 500,
              maxHeight: MediaQuery.sizeOf(context).height * 0.85,
            ),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.cardColor.withAlpha(230),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.colorScheme.onSurface.withAlpha(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryAccent.withAlpha(10),
                  blurRadius: 40,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryAccent.withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.system_update_alt,
                          color: AppColors.primaryAccent,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(width: 14.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.blockState?.title ??
                                  AppStrings.updateAvailableTitle,
                              style: TextStyle(
                                color: textTheme.bodyLarge?.color,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              ),
                            ),
                            if (widget.blockState?.isMaintenance != true &&
                                widget.newVersion != null &&
                                widget.newVersion!.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Text(
                                AppStrings.versionAvailableMsg(
                                  widget.newVersion!,
                                ),
                                style: TextStyle(
                                  color: textTheme.bodyMedium?.color,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  if (widget.blockState == null ||
                      widget.blockState!.isMaintenance == false) ...[
                    if (widget.blockState == null) ...[
                      Text(
                        AppStrings.whatsNewTitle,
                        style: TextStyle(
                          color: textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                    Container(
                      constraints: const BoxConstraints(maxHeight: 350),
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface.withAlpha(10),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: theme.colorScheme.onSurface.withAlpha(10),
                        ),
                      ),
                      // LayoutBuilder keeps the width bounded by the dialog
                      // constraints (no unbounded-width layout).
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: constraints.maxWidth,
                              ),
                              child: MarkdownBody(
                                data: _releaseNotes,
                                styleSheet: MarkdownStyleSheet(
                                  p: TextStyle(
                                    color: textTheme.bodyMedium?.color,
                                    fontSize: 13.0,
                                    height: 1.5,
                                  ),
                                  listBullet: const TextStyle(
                                    color: AppColors.primaryAccent,
                                    fontSize: 13.0,
                                  ),
                                  strong: TextStyle(
                                    color: textTheme.bodyLarge?.color,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.0,
                                  ),
                                  h1: TextStyle(
                                    color: textTheme.bodyLarge?.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                  h2: TextStyle(
                                    color: textTheme.bodyLarge?.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                  h3: TextStyle(
                                    color: textTheme.bodyLarge?.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24.0),
                  ] else ...[
                    Text(
                      _releaseNotes,
                      style: TextStyle(
                        color: textTheme.bodyMedium?.color,
                        fontSize: 14.0,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                  ],
                  if (_errorMessage.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.errorRed.withAlpha(15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.errorRed.withAlpha(30),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline_rounded,
                            color: AppColors.errorRed,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _errorMessage,
                              style: const TextStyle(
                                color: AppColors.errorRed,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                  if (_isDownloading)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _downloadStatus,
                              style: TextStyle(
                                color: textTheme.bodyMedium?.color,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${(_downloadProgress * 100).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                color: AppColors.primaryAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: _downloadProgress > 0
                                ? _downloadProgress
                                : null,
                            minHeight: 6,
                            backgroundColor: AppColors.primaryAccent.withAlpha(
                              40,
                            ),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primaryAccent,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (widget.blockState?.isMaintenance == true) ...[
                              ElevatedButton(
                                onPressed: () => exit(0),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.errorRed,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  AppStrings.exitAppBtn,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ] else ...[
                              if (!widget.isMandatory ||
                                  (widget.isMandatory &&
                                      widget.blockState?.allowBypass ==
                                          true)) ...[
                                TextButton(
                                  onPressed: _onLaterPressed,
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    AppStrings.laterBtn,
                                    style: TextStyle(
                                      color: textTheme.bodySmall?.color,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                              ],
                              Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.primaryAccent,
                                      AppColors.primaryAccentLight,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primaryAccent.withAlpha(
                                        60,
                                      ),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: _handleUpdate,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    _errorMessage.isNotEmpty
                                        ? AppStrings.retryBtn
                                        : AppStrings.updateNowBtn,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        if (_errorMessage.isNotEmpty &&
                            !const bool.fromEnvironment(
                              'STORE_RELEASE',
                              defaultValue: false,
                            )) ...[
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: _launchUpdateUrlFallback,
                            icon: const Icon(
                              Icons.open_in_browser,
                              size: 16,
                              color: AppColors.primaryAccent,
                            ),
                            label: Text(
                              AppStrings.downloadFromWebsiteBtn,
                              style: const TextStyle(
                                color: AppColors.primaryAccent,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.isMandatory) {
      return PopScope(canPop: false, child: dialogContent);
    }
    return dialogContent;
  }
}

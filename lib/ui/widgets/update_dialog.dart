import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';
import '../app_colors.dart';
import '../../core/app_constants.dart';

class UpdateDialog extends StatefulWidget {
  final String newVersion;
  final String whatsNew;
  final String downloadUrl;

  const UpdateDialog({
    super.key,
    required this.newVersion,
    required this.whatsNew,
    required this.downloadUrl,
  });

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  String _downloadStatus = '';
  String _errorMessage = '';

  Future<void> _launchUpdateUrlFallback() async {
    final Uri url = Uri.parse(AppConstants.websiteUrl);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }

  Future<void> _downloadAndInstall() async {
    setState(() {
      _isDownloading = true;
      _errorMessage = '';
      _downloadProgress = 0.0;
      _downloadStatus = 'Starting download...';
    });

    try {
      final request = http.Request('GET', Uri.parse(widget.downloadUrl));
      final http.StreamedResponse response = await http.Client().send(request);

      if (response.statusCode != 200) {
        throw Exception('Download failed with status: ${response.statusCode}');
      }

      final contentLength = response.contentLength;
      Directory tempDir = await getTemporaryDirectory();

      // Clean up old update files
      try {
        final List<FileSystemEntity> entities = tempDir.listSync();
        for (final entity in entities) {
          if (entity is File && entity.path.endsWith('.exe')) {
            entity.deleteSync();
          }
        }
      } catch (_) {}

      final String fileName = widget.downloadUrl.split('/').last;
      final File file = File(p.join(tempDir.path, fileName));
      final IOSink sink = file.openWrite();

      int downloaded = 0;
      await for (final chunk in response.stream) {
        sink.add(chunk);
        downloaded += chunk.length;
        if (contentLength != null && contentLength > 0) {
          if (mounted) {
            setState(() {
              _downloadProgress = downloaded / contentLength;
              final String downloadedMb = (downloaded / (1024 * 1024))
                  .toStringAsFixed(1);
              final String totalMb = (contentLength / (1024 * 1024))
                  .toStringAsFixed(1);
              _downloadStatus = '$downloadedMb MB / $totalMb MB';
            });
          }
        } else {
          if (mounted) {
            setState(() {
              final String downloadedMb = (downloaded / (1024 * 1024))
                  .toStringAsFixed(1);
              _downloadStatus = '$downloadedMb MB downloaded';
            });
          }
        }
      }

      await sink.flush();
      await sink.close();

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
          _errorMessage = 'Failed to download update. Please try again.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 500,
              maxHeight: MediaQuery.of(context).size.height * 0.85,
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
                              'Update Available',
                              style: TextStyle(
                                color: textTheme.bodyLarge?.color,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Version ${widget.newVersion} is now available.',
                              style: TextStyle(
                                color: textTheme.bodyMedium?.color,
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "What's New:",
                    style: TextStyle(
                      color: textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxHeight: 350),
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withAlpha(10),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: theme.colorScheme.onSurface.withAlpha(10),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: MarkdownBody(
                        data: widget.whatsNew,
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
                  ),
                  const SizedBox(height: 24.0),
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
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
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
                                'Later',
                                style: TextStyle(
                                  color: textTheme.bodySmall?.color,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: _downloadAndInstall,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
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
                                        color: AppColors.primaryAccent
                                            .withAlpha(60),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    _errorMessage.isNotEmpty
                                        ? 'Retry'
                                        : 'Update Now',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_errorMessage.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: _launchUpdateUrlFallback,
                            icon: const Icon(
                              Icons.open_in_browser,
                              size: 16,
                              color: AppColors.primaryAccent,
                            ),
                            label: const Text(
                              'Download from Website',
                              style: TextStyle(
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
  }
}

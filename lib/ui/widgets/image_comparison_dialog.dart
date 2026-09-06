import 'dart:io';
import 'dart:ui' as dart_ui;

import 'package:flutter/material.dart';

import '../../core/app_strings.dart';
import '../../models/file_item.dart';
import '../app_colors.dart';

/// Modal dialog for comparing original and compressed images side-by-side
/// using an interactive split-slider and pan-and-zoom inspection.
class ImageComparisonDialog extends StatefulWidget {
  final VideoFile video;

  const ImageComparisonDialog({super.key, required this.video});

  /// Displays the comparison dialog as a smooth blurred general dialog.
  static Future<void> show(BuildContext context, VideoFile video) {
    return showGeneralDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      barrierDismissible: true,
      barrierLabel: 'Close Comparison',
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, anim1, anim2, child) {
        final curve = CurvedAnimation(parent: anim1, curve: Curves.easeOutCubic);
        return FadeTransition(
          opacity: curve,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(curve),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return ImageComparisonDialog(video: video);
      },
    );
  }

  @override
  State<ImageComparisonDialog> createState() => _ImageComparisonDialogState();
}

class _ImageComparisonDialogState extends State<ImageComparisonDialog> {
  double _sliderPosition = 0.5; // 0.0 (all compressed) to 1.0 (all original)
  final TransformationController _transformController = TransformationController();
  bool _isZoomed = false;

  @override
  void initState() {
    super.initState();
    _transformController.addListener(_handleTransformChange);
  }

  @override
  void dispose() {
    _transformController.removeListener(_handleTransformChange);
    _transformController.dispose();
    super.dispose();
  }

  void _handleTransformChange() {
    final scale = _transformController.value.getMaxScaleOnAxis();
    final zoomed = (scale - 1.0).abs() > 0.05;
    if (zoomed != _isZoomed) {
      setState(() => _isZoomed = zoomed);
    }
  }

  void _resetZoom() {
    _transformController.value = Matrix4.identity();
    setState(() => _isZoomed = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenSize = MediaQuery.sizeOf(context);

    // Responsive bounds conforming to prohibition of double.infinity
    final dialogWidth = (screenSize.width * 0.88).clamp(520.0, 1140.0);
    final dialogHeight = (screenSize.height * 0.88).clamp(420.0, 880.0);

    final originalExists = File(widget.video.filePath).existsSync();
    final compressedExists =
        widget.video.outputPath != null && File(widget.video.outputPath!).existsSync();

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: dart_ui.ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            width: dialogWidth,
            height: dialogHeight,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.surfaceContainerDark.withValues(alpha: 0.92)
                  : AppColors.surfaceContainerLight.withValues(alpha: 0.94),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                // 1. Header with file details, size savings, and close button
                _buildHeader(context, theme, isDark),

                const Divider(height: 1, thickness: 1),

                // 2. Interactive Comparison Viewport
                Expanded(
                  child: (!originalExists || !compressedExists)
                      ? _buildMissingFilesNotice(theme)
                      : _buildComparisonArea(context, theme, isDark),
                ),

                const Divider(height: 1, thickness: 1),

                // 3. Footer Bar with instructions and zoom controls
                _buildFooter(theme, isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme, bool isDark) {
    final origBytes = widget.video.fileSizeBytes;
    final outBytes = widget.video.outputSizeBytes ?? origBytes;
    final savedBytes = (origBytes - outBytes).clamp(0, origBytes);
    final percentSaved =
        origBytes > 0 ? ((savedBytes / origBytes) * 100).round() : 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.compare_rounded,
              color: theme.colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.compareImagesTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.video.fileName,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // File size comparison badges
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: (isDark ? Colors.white : Colors.black).withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: (isDark ? Colors.white : Colors.black).withValues(alpha: 0.1),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  VideoFile.formatFileSize(origBytes),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 14,
                  color: theme.textTheme.bodySmall?.color,
                ),
                Text(
                  VideoFile.formatFileSize(outBytes),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: percentSaved > 0 ? AppColors.successGreen : null,
                  ),
                ),
                if (percentSaved > 0) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.successGreen.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '-$percentSaved%',
                      style: const TextStyle(
                        color: AppColors.successGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(width: 14),

          // Close button
          IconButton(
            icon: const Icon(Icons.close_rounded, size: 20),
            onPressed: () => Navigator.of(context).pop(),
            tooltip: AppStrings.closeTooltip,
            splashRadius: 18,
            style: IconButton.styleFrom(
              backgroundColor: (isDark ? Colors.white : Colors.black).withValues(alpha: 0.05),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonArea(BuildContext context, ThemeData theme, bool isDark) {
    final originalFile = File(widget.video.filePath);
    final compressedFile = File(widget.video.outputPath!);

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final totalHeight = constraints.maxHeight;
        final splitX = totalWidth * _sliderPosition;

        return Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // Checkerboard pattern for transparency clarity
            Positioned.fill(
              child: CustomPaint(
                painter: _CheckerboardPainter(isDark: isDark),
              ),
            ),

            // Pan & Zoom Container
            Positioned.fill(
              child: InteractiveViewer(
                transformationController: _transformController,
                minScale: 1.0,
                maxScale: 6.0,
                boundaryMargin: const EdgeInsets.all(40),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Layer 1: Original Image (fills the background)
                    Image.file(
                      originalFile,
                      fit: BoxFit.contain,
                      width: totalWidth,
                      height: totalHeight,
                      filterQuality: FilterQuality.medium,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildImageError(theme, AppStrings.originalLabel),
                    ),

                    // Layer 2: Compressed Image (clipped horizontally by slider position)
                    ClipRect(
                      clipper: _SplitSliderClipper(_sliderPosition),
                      child: Image.file(
                        compressedFile,
                        fit: BoxFit.contain,
                        width: totalWidth,
                        height: totalHeight,
                        filterQuality: FilterQuality.medium,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildImageError(theme, AppStrings.compressedLabel),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Floating Badges: Original (Left) vs Compressed (Right)
            Positioned(
              top: 14,
              left: 16,
              child: _buildBadge(
                theme,
                isDark,
                AppStrings.originalLabel,
                Icons.image_outlined,
              ),
            ),
            Positioned(
              top: 14,
              right: 16,
              child: _buildBadge(
                theme,
                isDark,
                AppStrings.compressedLabel,
                Icons.check_circle_outline_rounded,
                isCompressed: true,
              ),
            ),

            // Vertical Split Divider Line
            Positioned(
              left: splitX - 1.5,
              top: 0,
              bottom: 0,
              width: 3.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),

            // Centered Slider Drag Handle
            Positioned(
              left: splitX - 18,
              top: (totalHeight / 2) - 18,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.code_rounded,
                    size: 18,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),

            // Full-surface transparent Drag Detector
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _sliderPosition =
                        (_sliderPosition + details.delta.dx / totalWidth).clamp(0.01, 0.99);
                  });
                },
                onTapDown: (details) {
                  setState(() {
                    _sliderPosition =
                        (details.localPosition.dx / totalWidth).clamp(0.01, 0.99);
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBadge(
    ThemeData theme,
    bool isDark,
    String label,
    IconData icon, {
    bool isCompressed = false,
  }) {
    return IgnorePointer(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: dart_ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: (isDark ? Colors.black : Colors.white).withValues(alpha: 0.65),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isCompressed
                    ? AppColors.successGreen.withValues(alpha: 0.4)
                    : (isDark ? Colors.white : Colors.black).withValues(alpha: 0.15),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 14,
                  color: isCompressed
                      ? AppColors.successGreen
                      : (isDark ? Colors.white70 : Colors.black87),
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: isCompressed
                        ? AppColors.successGreen
                        : (isDark ? Colors.white : Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(ThemeData theme, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.touch_app_outlined,
            size: 16,
            color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              AppStrings.dragToCompare,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.8),
              ),
            ),
          ),
          if (_isZoomed) ...[
            TextButton.icon(
              onPressed: _resetZoom,
              icon: const Icon(Icons.zoom_out_map_rounded, size: 16),
              label: Text(AppStrings.resetZoomTooltip),
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMissingFilesNotice(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.broken_image_rounded,
              size: 48,
              color: AppColors.errorRed,
            ),
            const SizedBox(height: 12),
            Text(
              AppStrings.imageFilesNotFound,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageError(ThemeData theme, String label) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline_rounded, size: 36, color: Colors.orange),
          const SizedBox(height: 8),
          Text('$label Error', style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}

/// Custom clipper that exposes the compressed image from [splitFraction] to 1.0 (right side).
class _SplitSliderClipper extends CustomClipper<Rect> {
  final double splitFraction; // 0.0 to 1.0

  const _SplitSliderClipper(this.splitFraction);

  @override
  Rect getClip(Size size) {
    final left = size.width * splitFraction;
    return Rect.fromLTWH(left, 0, size.width - left, size.height);
  }

  @override
  bool shouldReclip(covariant _SplitSliderClipper oldClipper) {
    return oldClipper.splitFraction != splitFraction;
  }
}

/// Subtle checkerboard painter for showing transparent background behind images.
class _CheckerboardPainter extends CustomPainter {
  final bool isDark;

  _CheckerboardPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final lightColor = isDark
        ? const Color(0xFF1E1E24)
        : const Color(0xFFF3F3F5);
    final darkColor = isDark
        ? const Color(0xFF16161B)
        : const Color(0xFFE8E8EC);

    final bgPaint = Paint()..color = lightColor;
    canvas.drawRect(Offset.zero & size, bgPaint);

    final checkPaint = Paint()..color = darkColor;
    const squareSize = 16.0;

    for (double y = 0; y < size.height; y += squareSize) {
      for (double x = 0; x < size.width; x += squareSize) {
        if (((x / squareSize).floor() + (y / squareSize).floor()) % 2 == 0) {
          canvas.drawRect(
            Rect.fromLTWH(x, y, squareSize, squareSize),
            checkPaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CheckerboardPainter oldDelegate) {
    return oldDelegate.isDark != isDark;
  }
}

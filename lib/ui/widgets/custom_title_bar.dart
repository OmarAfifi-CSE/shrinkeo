import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_manager/window_manager.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../app_colors.dart';

class CustomTitleBar extends StatelessWidget {
  const CustomTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onPanStart: (_) => windowManager.startDragging(),
      child: Container(
        height: 42,
        color: Colors.transparent,
        child: Row(
          children: [
            const SizedBox(width: 14),

            // App icon
            Image.asset(
              theme.brightness == Brightness.dark
                  ? 'assets/images/app_icon_dark.png'
                  : 'assets/images/app_icon_light.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),

            // App title
            Text(
              'Shrinkeo',
              style: TextStyle(
                color: theme.textTheme.titleLarge?.color ?? Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(width: 8),

            // Global Saved Space badge
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) =>
                  prev.globalSavedBytes != curr.globalSavedBytes,
              builder: (context, state) {
                if (state.globalSavedBytes <= 0) return const SizedBox.shrink();

                final isDark = theme.brightness == Brightness.dark;
                final badgeColor = isDark
                    ? AppColors.successGreen
                    : const Color(0xFF059669);

                String formatBytes(int bytes) {
                  if (bytes < 1024) return '$bytes B';
                  if (bytes < 1024 * 1024) {
                    return '${(bytes / 1024).toStringAsFixed(1)} KB';
                  }
                  if (bytes < 1024 * 1024 * 1024) {
                    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
                  }
                  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
                }

                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Tooltip(
                    message: 'Total Space Saved Globally',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: badgeColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.eco_rounded, size: 12, color: badgeColor),
                          const SizedBox(width: 4),
                          Text(
                            'Saved: ${formatBytes(state.globalSavedBytes)}',
                            style: TextStyle(
                              color: badgeColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const Spacer(),

            // Global error indicator
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) => prev.globalError != curr.globalError,
              builder: (context, state) {
                if (state.globalError == null) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Tooltip(
                    message: state.globalError!,
                    child: const Icon(
                      Icons.warning_amber_rounded,
                      color: AppColors.warningOrange,
                      size: 16,
                    ),
                  ),
                );
              },
            ),

            // Active config badge
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) =>
                  prev.crfQuality != curr.crfQuality ||
                  prev.encodingPreset != curr.encodingPreset,
              builder: (context, state) {
                final isDark = theme.brightness == Brightness.dark;
                final badgeColor = isDark
                    ? AppColors.primaryAccentLight
                    : AppColors.primaryAccent;

                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: badgeColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: badgeColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      'CRF ${state.crfQuality} · ${state.encodingPreset.label}',
                      style: TextStyle(
                        color: badgeColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),

            // Theme toggle
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) => prev.themeMode != curr.themeMode,
              builder: (context, state) {
                final isDark =
                    state.themeMode == ThemeMode.dark ||
                    (state.themeMode == ThemeMode.system &&
                        MediaQuery.platformBrightnessOf(context) ==
                            Brightness.dark);
                return _TitleBarButton(
                  icon: isDark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  iconColor: theme.iconTheme.color,
                  onTap: () => context.read<CompressionCubit>().toggleTheme(),
                  tooltip: isDark ? 'Light Theme' : 'Dark Theme',
                );
              },
            ),

            // Settings toggle
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) =>
                  prev.isSettingsExpanded != curr.isSettingsExpanded,
              builder: (context, state) {
                return _TitleBarButton(
                  icon: Icons.tune_rounded,
                  iconColor: state.isSettingsExpanded
                      ? theme.colorScheme.primary
                      : theme.iconTheme.color,
                  onTap: () =>
                      context.read<CompressionCubit>().toggleSettings(),
                  tooltip: 'Settings',
                );
              },
            ),

            // Divider
            Container(width: 1, height: 18, color: theme.dividerTheme.color),

            // Window controls
            _TitleBarButton(
              icon: Icons.remove_rounded,
              iconColor: theme.iconTheme.color,
              onTap: () => windowManager.minimize(),
              tooltip: 'Minimize',
            ),
            _MaximizeButton(),
            _TitleBarButton(
              icon: Icons.close_rounded,
              iconColor: theme.iconTheme.color,
              onTap: () => windowManager.close(),
              hoverColor: AppColors.errorRed,
              tooltip: 'Close',
            ),
          ],
        ),
      ),
    );
  }
}

/// Maximize/restore button that reacts to window state.
class _MaximizeButton extends StatefulWidget {
  @override
  State<_MaximizeButton> createState() => _MaximizeButtonState();
}

class _MaximizeButtonState extends State<_MaximizeButton> with WindowListener {
  bool _isMaximized = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _checkMaximized();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  Future<void> _checkMaximized() async {
    final maximized = await windowManager.isMaximized();
    if (mounted) setState(() => _isMaximized = maximized);
  }

  @override
  void onWindowMaximize() => setState(() => _isMaximized = true);

  @override
  void onWindowUnmaximize() => setState(() => _isMaximized = false);

  @override
  Widget build(BuildContext context) {
    return _TitleBarButton(
      icon: _isMaximized
          ? Icons.filter_none_rounded
          : Icons.crop_square_rounded,
      iconColor: Theme.of(context).iconTheme.color,
      iconSize: _isMaximized ? 13 : 15,
      onTap: () async {
        if (await windowManager.isMaximized()) {
          await windowManager.unmaximize();
        } else {
          await windowManager.maximize();
        }
      },
      tooltip: _isMaximized ? 'Restore' : 'Maximize',
    );
  }
}

/// Individual button in the custom title bar.
class _TitleBarButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? hoverColor;
  final double iconSize;
  final String? tooltip;

  const _TitleBarButton({
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.hoverColor,
    this.iconSize = 15,
    this.tooltip,
  });

  @override
  State<_TitleBarButton> createState() => _TitleBarButtonState();
}

class _TitleBarButtonState extends State<_TitleBarButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 42,
          height: 42,
          color: _isHovered
              ? (widget.hoverColor ??
                        Theme.of(context).iconTheme.color ??
                        Colors.white)
                    .withValues(alpha: widget.hoverColor != null ? 0.9 : 0.06)
              : Colors.transparent,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: _isHovered && widget.hoverColor != null
                ? Colors.white
                : (widget.iconColor ?? Theme.of(context).iconTheme.color),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(message: widget.tooltip!, child: button);
    }
    return button;
  }
}

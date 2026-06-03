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
        color: theme.scaffoldBackgroundColor,
        child: Row(
          children: [
            const SizedBox(width: 14),

            // App icon
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withValues(alpha: 0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.compress_rounded,
                color: Colors.white,
                size: 16,
              ),
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

            // Version badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: theme.dividerTheme.color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'v1.0.0',
                style: TextStyle(
                  color: theme.iconTheme.color?.withValues(alpha: 0.5),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: theme.dividerTheme.color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'CRF ${state.crfQuality} · ${state.encodingPreset.label}',
                      style: TextStyle(
                        color: theme.iconTheme.color?.withValues(alpha: 0.6),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
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
                final isDark = state.themeMode == ThemeMode.dark ||
                    (state.themeMode == ThemeMode.system &&
                        MediaQuery.platformBrightnessOf(context) ==
                            Brightness.dark);
                return _TitleBarButton(
                  icon: isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
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
            Container(
              width: 1,
              height: 18,
              color: theme.dividerTheme.color,
            ),

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
              ? (widget.hoverColor ?? Theme.of(context).iconTheme.color ?? Colors.white).withValues(
                  alpha: widget.hoverColor != null ? 0.9 : 0.06,
                )
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

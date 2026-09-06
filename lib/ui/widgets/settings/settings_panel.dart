import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_strings.dart';
import '../../../core/file_picker_helper.dart';
import '../../../cubit/compression_cubit.dart';
import '../../../cubit/compression_state.dart';
import '../../app_colors.dart';
import '../glass_container.dart';

part 'settings_components.dart';

/// Collapsible settings panel with Sliding TabBar and TabBarView.
class SettingsPanel extends StatelessWidget {
  const SettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BlocBuilder<CompressionCubit, CompressionState>(
        // Rebuild only when a rendered setting (or the expanded/locked state)
        // changes — never on processing progress ticks.
        buildWhen: (prev, curr) => curr.settingsDifferFrom(prev),
        builder: (context, state) {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            sizeCurve: Curves.easeOut,
            crossFadeState: state.isSettingsExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: _SettingsContent(state: state),
          );
        },
      ),
    );
  }
}

class _SettingsContent extends StatefulWidget {
  final CompressionState state;

  const _SettingsContent({required this.state});

  @override
  State<_SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<_SettingsContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    final newIndex = _tabController.index;
    if (_activeTabIndex != newIndex) {
      setState(() {
        _activeTabIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isLocked = widget.state.isProcessing;

    final activeColor = isDark
        ? AppColors.primaryAccentLight
        : AppColors.primaryAccent;
    final inactiveBorder = isDark
        ? AppColors.borderDark
        : AppColors.borderLight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GlassContainer(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Section header & Reset button --
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      context.read<CompressionCubit>().toggleSettings();
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.tune_rounded,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppStrings.compressionSettingsTitle,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.textTheme.titleLarge?.color,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            size: 16,
                            color: theme.textTheme.titleSmall?.color?.withValues(alpha: 0.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isLocked) ...[
                  const SizedBox(width: 10),
                  Builder(
                    builder: (context) {
                      final warningColor = isDark
                          ? Colors.orangeAccent.shade200
                          : AppColors.warningOrange;

                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: warningColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          AppStrings.lockedSettingsWarning,
                          style: TextStyle(
                            color: isDark
                                ? warningColor
                                : warningColor.withValues(alpha: 0.7),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ],
                const Spacer(),
                if (!isLocked)
                  TextButton.icon(
                    onPressed: () =>
                        context.read<CompressionCubit>().resetToDefaults(),
                    icon: const Icon(Icons.refresh_rounded, size: 14),
                    label: Text(AppStrings.resetToDefaults,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.textTheme.bodyMedium?.color
                          ?.withValues(alpha: 0.8),
                      backgroundColor: isDark
                          ? Colors.white.withValues(alpha: 0.05)
                          : Colors.black.withValues(alpha: 0.03),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),

            // -- User's Custom Smooth Sliding TabBar --
            Container(
              height: 38,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.2)
                    : Colors.black.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: inactiveBorder.withValues(alpha: 0.3),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.12)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                labelColor: activeColor,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
                unselectedLabelColor: theme.textTheme.bodyMedium?.color
                    ?.withValues(alpha: 0.7),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                tabs: [
                  Tab(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.tune_rounded, size: 15),
                          const SizedBox(width: 6),
                          Text(AppStrings.tabCompressionQuality),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.transform_rounded, size: 15),
                          const SizedBox(width: 6),
                          Text(AppStrings.tabVideoEditingTools),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.graphic_eq_rounded, size: 15),
                          const SizedBox(width: 6),
                          Text(AppStrings.tabAudioSettings),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.settings_suggest_rounded, size: 15),
                          const SizedBox(width: 6),
                          Text(AppStrings.tabEngineOutput),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image_rounded, size: 15),
                          const SizedBox(width: 6),
                          Text(AppStrings.tabImageSuite),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // -- Smooth Synchronized TabBarView Content --
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              height: _getTabHeight(_activeTabIndex, widget.state),
              child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  _KeepAliveTab(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: _VideoTabContent(
                        state: widget.state,
                        isLocked: isLocked,
                      ),
                    ),
                  ),
                  _KeepAliveTab(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: _ToolsTabContent(
                        state: widget.state,
                        isLocked: isLocked,
                      ),
                    ),
                  ),
                  _KeepAliveTab(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: _AudioTabContent(
                        state: widget.state,
                        isLocked: isLocked,
                      ),
                    ),
                  ),
                  _KeepAliveTab(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: _EngineTabContent(
                        state: widget.state,
                        isLocked: isLocked,
                      ),
                    ),
                  ),
                  _KeepAliveTab(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: _ImageTab(state: widget.state),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getTabHeight(int index, CompressionState state) => switch (index) {
    0 => 400.0,
    1 => 505.0,
    2 => 230.0,
    3 => state.outputLocationMode == OutputLocationMode.unified
        ? 320.0
        : 230.0,
    _ => 400.0,
  };
}

/// Retains tab subtree state in memory to eliminate recreate churn on tab switch.
class _KeepAliveTab extends StatefulWidget {
  final Widget child;

  const _KeepAliveTab({required this.child});

  @override
  State<_KeepAliveTab> createState() => _KeepAliveTabState();
}

class _KeepAliveTabState extends State<_KeepAliveTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

/// Isolated widget for the Video Quality tab.
class _VideoTabContent extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _VideoTabContent({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('tab_video'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _CrfSection(state: state, isLocked: isLocked),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _PresetSection(state: state, isLocked: isLocked),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CodecSection(state: state, isLocked: isLocked),
                  const SizedBox(height: 14),
                  _OutputFormatSection(state: state, isLocked: isLocked),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ResolutionSection(state: state, isLocked: isLocked),
                  const SizedBox(height: 14),
                  _FrameRateSection(state: state, isLocked: isLocked),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Isolated widget for the Audio Settings tab.
class _AudioTabContent extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _AudioTabContent({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const ValueKey('tab_audio'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AudioModeSection(state: state, isLocked: isLocked),
              const SizedBox(height: 14),
              _AudioChannelsSection(state: state, isLocked: isLocked),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _AudioNormalizeSection(state: state, isLocked: isLocked),
        ),
      ],
    );
  }
}

/// Isolated widget for the Engine & Output tab.
class _EngineTabContent extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _EngineTabContent({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('tab_engine'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HardwareEncoderSection(state: state, isLocked: isLocked),
                  const SizedBox(height: 14),
                  _OutputLocationSection(state: state, isLocked: isLocked),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FileManagementSection(state: state, isLocked: isLocked),
                ],
              ),
            ),
          ],
        ),
        if (state.outputLocationMode == OutputLocationMode.unified) ...[
          const SizedBox(height: 14),
          _OutputDirectorySection(state: state, isLocked: isLocked),
        ],
      ],
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_strings.dart';
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
    return BlocBuilder<CompressionCubit, CompressionState>(
      buildWhen: (prev, curr) => prev != curr,
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant _SettingsContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != widget.state) {
      setState(() {});
    }
  }

  @override
  void dispose() {
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
                          'Locked during compression',
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
                    label: const Text(
                      AppStrings.resetToDefaults,
                      style: TextStyle(
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
            const SizedBox(height: 12),

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
                tabs: const [
                  Tab(text: "🎬 Video & Format"),
                  Tab(text: "🎵 Audio Settings"),
                  Tab(text: "⚙️ Engine & Output"),
                  Tab(text: "✂️ Quick Tools"),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // -- Smooth Sliding TabBarView Content --
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              height: _tabController.index == 0
                  ? 400.0
                  : _tabController.index == 1
                      ? 230.0
                      : _tabController.index == 2
                          ? (widget.state.outputLocationMode ==
                                  OutputLocationMode.unified
                              ? 320.0
                              : 230.0)
                          : 490.0,
              child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: _buildVideoTab(isLocked, widget.state),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: _buildAudioTab(isLocked, widget.state),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: _buildEngineTab(isLocked, widget.state),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: _ToolsTabContent(state: widget.state, isLocked: isLocked),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoTab(bool isLocked, CompressionState state) {
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

  Widget _buildAudioTab(bool isLocked, CompressionState state) {
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

  Widget _buildEngineTab(bool isLocked, CompressionState state) {
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

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_strings.dart';
import '../../../cubit/compression_cubit.dart';
import '../../../cubit/compression_state.dart';
import '../../app_colors.dart';
import '../glass_container.dart';

part 'settings_components.dart';

/// Collapsible settings panel for CRF quality and encoding preset.
///
/// Mirrors the options from the PowerShell script:
/// - CRF quality: 0-51 slider with tier labels
/// - Encoding preset: dropdown with speed/size descriptions
class SettingsPanel extends StatelessWidget {
  const SettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompressionCubit, CompressionState>(
      buildWhen: (prev, curr) =>
          prev.isSettingsExpanded != curr.isSettingsExpanded ||
          prev.encodingPreset != curr.encodingPreset ||
          prev.videoCodec != curr.videoCodec ||
          prev.hardwareEncoder != curr.hardwareEncoder ||
          prev.crfQuality != curr.crfQuality ||
          prev.isProcessing != curr.isProcessing ||
          prev.customOutputDirectory != curr.customOutputDirectory ||
          prev.audioMode != curr.audioMode ||
          prev.resolutionMode != curr.resolutionMode ||
          prev.frameRateMode != curr.frameRateMode ||
          prev.outputFormat != curr.outputFormat,
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

class _SettingsContent extends StatelessWidget {
  final CompressionState state;

  const _SettingsContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLocked = state.isProcessing;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GlassContainer(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Section header --
            Row(
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
                if (isLocked) ...[
                  const SizedBox(width: 10),
                  Builder(
                    builder: (context) {
                      final isDark =
                          Theme.of(context).brightness == Brightness.dark;
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
                      backgroundColor: theme.brightness == Brightness.dark
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

            // -- Two-column layout --
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -- CRF Quality --
                Expanded(
                  child: _CrfSection(state: state, isLocked: isLocked),
                ),
                const SizedBox(width: 32),
                // -- Encoding Preset --
                Expanded(
                  child: _PresetSection(state: state, isLocked: isLocked),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column: Codec, Hardware
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CodecSection(state: state, isLocked: isLocked),
                      const SizedBox(height: 16),
                      _HardwareEncoderSection(state: state, isLocked: isLocked),
                      const SizedBox(height: 16),
                      _OutputFormatSection(state: state, isLocked: isLocked),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                // Right Column: Resolution, Audio & Output Format
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ResolutionSection(state: state, isLocked: isLocked),
                      const SizedBox(height: 16),
                      _FrameRateSection(state: state, isLocked: isLocked),
                      const SizedBox(height: 16),
                      _AudioModeSection(state: state, isLocked: isLocked),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // -- Output Directory Section --
            _OutputDirectorySection(state: state, isLocked: isLocked),
          ],
        ),
      ),
    );
  }
}


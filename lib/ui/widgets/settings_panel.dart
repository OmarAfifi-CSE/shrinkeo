import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../app_colors.dart';

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
          prev.crfQuality != curr.crfQuality ||
          prev.encodingPreset != curr.encodingPreset ||
          prev.isProcessing != curr.isProcessing,
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
    final isDark = theme.brightness == Brightness.dark;
    final surfaceContainer = isDark ? AppColors.surfaceContainerDark : AppColors.surfaceContainerLight;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: surfaceContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor.withValues(alpha: 0.8)),
          boxShadow: isDark
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
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
                'Compression Settings',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.titleLarge?.color,
                ),
              ),
              if (isLocked) ...[
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.warningOrange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Locked during compression',
                    style: TextStyle(
                      color: AppColors.warningOrange.withValues(alpha: 0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),

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
          const SizedBox(height: 24),
          // -- Output Directory Section --
          _OutputDirectorySection(state: state, isLocked: isLocked),
        ],
      ),
    ),
  );
}
}

/// Output directory picker section.
class _OutputDirectorySection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _OutputDirectorySection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Output Directory',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: (Theme.of(context).brightness == Brightness.dark ? AppColors.borderDark : AppColors.borderLight).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: (Theme.of(context).brightness == Brightness.dark ? AppColors.borderDark : AppColors.borderLight).withValues(alpha: 0.4),
                  ),
                ),
                child: Text(
                  state.customOutputDirectory ??
                      'Default (Next to original file)',
                  style: TextStyle(
                    color: state.customOutputDirectory == null
                        ? theme.textTheme.bodySmall?.color
                        : theme.textTheme.bodyMedium?.color,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: isLocked
                  ? null
                  : () async {
                      try {
                        final result = await FilePicker.getDirectoryPath();
                        if (result != null) {
                          cubit.updateCustomOutputDirectory(result);
                        }
                      } catch (_) {}
                    },
              icon: const Icon(Icons.folder_open_rounded, size: 16),
              label: const Text('Change'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
            if (state.customOutputDirectory != null) ...[
              const SizedBox(width: 8),
              IconButton(
                onPressed: isLocked
                    ? null
                    : () => cubit.updateCustomOutputDirectory(null),
                icon: const Icon(Icons.clear_rounded, size: 18),
                color: theme.textTheme.bodySmall?.color,
                tooltip: 'Reset to default',
              ),
            ],
          ],
        ),
      ],
    );
  }
}

/// CRF quality slider with tier labels matching the PowerShell script.
class _CrfSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _CrfSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title row
        Row(
          children: [
            Text(
              'Video Quality (CRF)',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: _crfColor(state.crfQuality).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: _crfColor(state.crfQuality).withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                '${state.crfQuality} — ${state.crfLabel}',
                style: TextStyle(
                  color: _crfColor(state.crfQuality),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Slider
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: _crfColor(state.crfQuality),
            inactiveTrackColor: (Theme.of(context).brightness == Brightness.dark ? AppColors.borderDark : AppColors.borderLight),
            thumbColor: _crfColor(state.crfQuality),
            overlayColor: _crfColor(state.crfQuality).withValues(alpha: 0.12),
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
          ),
          child: Slider(
            value: state.crfQuality.toDouble(),
            min: 0,
            max: 51,
            divisions: 51,
            onChanged: isLocked
                ? null
                : (value) => cubit.updateCrfQuality(value.round()),
          ),
        ),

        // Scale labels
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ScaleLabel('0', 'Lossless'),
              _ScaleLabel('18', 'High'),
              _ScaleLabel('22', 'Balanced'),
              _ScaleLabel('28', 'Small'),
              _ScaleLabel('51', 'Low'),
            ],
          ),
        ),
      ],
    );
  }

  Color _crfColor(int crf) {
    if (crf <= 17) return AppColors.infoBlue;
    if (crf <= 20) return const Color(0xFF26C6DA);
    if (crf <= 23) return AppColors.successGreen;
    if (crf <= 26) return AppColors.warningOrange;
    return AppColors.errorRed;
  }
}

/// Encoding preset dropdown matching the PowerShell script presets.
class _PresetSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _PresetSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Encoding Speed',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 8),

        // Preset options as a wrap of selectable chips
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: EncodingPreset.values.map((preset) {
            final isSelected = state.encodingPreset == preset;
            return Tooltip(
              message: preset.description,
              child: InkWell(
                onTap: isLocked
                    ? null
                    : () => cubit.updateEncodingPreset(preset),
                borderRadius: BorderRadius.circular(8),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary.withValues(alpha: 0.15)
                        : (Theme.of(context).brightness == Brightness.dark ? AppColors.borderDark : AppColors.borderLight).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? theme.colorScheme.primary.withValues(alpha: 0.5)
                          : (Theme.of(context).brightness == Brightness.dark ? AppColors.borderDark : AppColors.borderLight).withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    preset.label,
                    style: TextStyle(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.textTheme.bodySmall?.color,
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 10),

        // Description of selected preset
        Row(
          children: [
            Icon(Icons.info_outline_rounded, size: 13, color: theme.textTheme.bodySmall?.color),
            const SizedBox(width: 5),
            Text(
              '${state.encodingPreset.label}: ${state.encodingPreset.description}',
              style: TextStyle(color: theme.textTheme.bodySmall?.color, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}

/// Tiny scale label for the CRF slider.
class _ScaleLabel extends StatelessWidget {
  final String value;
  final String label;

  const _ScaleLabel(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: theme.textTheme.bodySmall?.color,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(label, style: TextStyle(color: theme.textTheme.bodySmall?.color, fontSize: 9)),
      ],
    );
  }
}

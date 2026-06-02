import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../app_theme.dart';

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

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerDark,
        border: Border(
          bottom: BorderSide(
            color: AppTheme.borderDark.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Section header --
          Row(
            children: [
              Icon(Icons.tune_rounded,
                  size: 16, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'Compression Settings',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              if (isLocked) ...[
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.warningOrange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Locked during compression',
                    style: TextStyle(
                      color: AppTheme.warningOrange.withValues(alpha: 0.7),
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
              Expanded(child: _CrfSection(state: state, isLocked: isLocked)),
              const SizedBox(width: 32),
              // -- Encoding Preset --
              Expanded(
                  child: _PresetSection(state: state, isLocked: isLocked)),
            ],
          ),
        ],
      ),
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
                color: Colors.white70,
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
            inactiveTrackColor: AppTheme.borderDark,
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
    if (crf <= 17) return AppTheme.infoBlue;
    if (crf <= 20) return const Color(0xFF26C6DA);
    if (crf <= 23) return AppTheme.successGreen;
    if (crf <= 26) return AppTheme.warningOrange;
    return AppTheme.errorRed;
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
            color: Colors.white70,
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
                      horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary.withValues(alpha: 0.15)
                        : AppTheme.borderDark.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? theme.colorScheme.primary.withValues(alpha: 0.5)
                          : AppTheme.borderDark.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    preset.label,
                    style: TextStyle(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : Colors.white54,
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
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
            Icon(Icons.info_outline_rounded,
                size: 13, color: Colors.white24),
            const SizedBox(width: 5),
            Text(
              '${state.encodingPreset.label}: ${state.encodingPreset.description}',
              style: TextStyle(
                color: Colors.white30,
                fontSize: 11,
              ),
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
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white30,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white24,
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}

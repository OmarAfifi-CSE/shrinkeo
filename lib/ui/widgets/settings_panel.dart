import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../app_colors.dart';

import 'glass_container.dart';

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
          prev.isProcessing != curr.isProcessing ||
          prev.customOutputDirectory != curr.customOutputDirectory,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: GlassContainer(
        padding: const EdgeInsets.all(20),
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
              child: SizedBox(
                height: 40,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color:
                        (Theme.of(context).brightness == Brightness.dark
                                ? AppColors.borderDark
                                : AppColors.borderLight)
                            .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:
                          (Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.borderDark
                                  : AppColors.borderLight)
                              .withValues(alpha: 0.4),
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
            ),
            const SizedBox(width: 12),
            SizedBox(
              height: 40,
              child: OutlinedButton.icon(
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
            inactiveTrackColor: (Theme.of(context).brightness == Brightness.dark
                ? AppColors.borderDark
                : AppColors.borderLight),
            thumbColor: _crfColor(state.crfQuality),
            overlayColor: _crfColor(state.crfQuality).withValues(alpha: 0.12),
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
            tickMarkShape: SliderTickMarkShape.noTickMark,
            valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
            valueIndicatorColor: _crfColor(state.crfQuality),
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
            showValueIndicator: ShowValueIndicator.onDrag,
          ),
          child: Slider(
            value: state.crfQuality.toDouble(),
            min: 0,
            max: 51,
            divisions: 51,
            label: '${state.crfQuality}',
            onChanged: isLocked
                ? null
                : (value) => cubit.updateCrfQuality(value.round()),
          ),
        ),

        // Scale labels
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_ScaleLabel('0', 'Lossless'), _ScaleLabel('51', 'Low')],
          ),
        ),
      ],
    );
  }

  Color _crfColor(int crf) {
    if (crf == 0) return AppColors.infoBlue;
    if (crf <= 18) return AppColors.crfVeryHighQuality;
    if (crf <= 24) return AppColors.successGreen;
    if (crf <= 30) return AppColors.warningOrange;
    if (crf <= 40) return AppColors.errorRed;
    return AppColors.crfUltraCompressed;
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
            return _PresetChip(
              preset: preset,
              isSelected: state.encodingPreset == preset,
              isLocked: isLocked,
              onTap: () => cubit.updateEncodingPreset(preset),
            );
          }).toList(),
        ),

        const SizedBox(height: 10),

        // Description of selected preset
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color:
                (theme.brightness == Brightness.dark
                        ? AppColors.borderDark
                        : AppColors.borderLight)
                    .withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color:
                  (theme.brightness == Brightness.dark
                          ? AppColors.borderDark
                          : AppColors.borderLight)
                      .withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 14,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: theme.textTheme.bodyMedium?.color,
                      fontSize: 11,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: '${state.encodingPreset.label}: ',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: state.encodingPreset.description,
                        style: TextStyle(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
        Text(
          label,
          style: TextStyle(
            color: theme.textTheme.bodySmall?.color,
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}

class _PresetChip extends StatefulWidget {
  final EncodingPreset preset;
  final bool isSelected;
  final bool isLocked;
  final VoidCallback onTap;

  const _PresetChip({
    required this.preset,
    required this.isSelected,
    required this.isLocked,
    required this.onTap,
  });

  @override
  State<_PresetChip> createState() => _PresetChipState();
}

class _PresetChipState extends State<_PresetChip> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final activeColor = isDark
        ? AppColors.primaryAccentLight
        : AppColors.primaryAccent;
    final inactiveBorder = isDark
        ? AppColors.borderDark
        : AppColors.borderLight;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: widget.isLocked
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.isLocked ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? activeColor.withValues(alpha: 0.15)
                : _isHovering && !widget.isLocked
                ? activeColor.withValues(alpha: 0.05)
                : inactiveBorder.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isSelected
                  ? activeColor.withValues(alpha: 0.5)
                  : _isHovering && !widget.isLocked
                  ? activeColor.withValues(alpha: 0.3)
                  : inactiveBorder.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            widget.preset.label,
            style: TextStyle(
              color: widget.isSelected
                  ? activeColor
                  : _isHovering && !widget.isLocked
                  ? activeColor
                  : theme.textTheme.bodySmall?.color,
              fontSize: 12,
              fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

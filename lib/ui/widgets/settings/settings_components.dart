part of 'settings_panel.dart';

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
          AppStrings.outputDirectoryTitle,
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
                        AppStrings.defaultOutputDirectory,
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

/// Section for selecting Output Location Behavior.
class _OutputLocationSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _OutputLocationSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.outputLocationTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: OutputLocationMode.values.map((mode) {
            return _OptionChip(
              label: mode.label,
              isSelected: state.outputLocationMode == mode,
              isLocked: isLocked,
              onTap: () => cubit.updateOutputLocationMode(mode),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.outputLocationMode.label,
          description: state.outputLocationMode.description,
          icon: Icons.folder_copy_rounded,
        ),
      ],
    );
  }
}

/// Section for File Management settings.
class _FileManagementSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _FileManagementSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'File Management',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            _OptionChip(
              label: 'Keep Originals',
              isSelected: !state.deleteOriginalOnSuccess,
              isLocked: isLocked,
              onTap: () => cubit.updateDeleteOriginalOnSuccess(false),
            ),
            _OptionChip(
              label: 'To Recycle Bin',
              isSelected: state.deleteOriginalOnSuccess,
              isLocked: isLocked,
              onTap: () => cubit.updateDeleteOriginalOnSuccess(true),
            ),
          ],
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.deleteOriginalOnSuccess
              ? 'To Recycle Bin'
              : 'Keep Originals',
          description: state.deleteOriginalOnSuccess
              ? 'Moves originals to the Recycle Bin after successful compression.'
              : 'Keeps the original videos untouched after compression.',
          icon: state.deleteOriginalOnSuccess
              ? Icons.delete_outline_rounded
              : Icons.save_rounded,
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
              AppStrings.crfQualityTitle,
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
          AppStrings.encodingSpeedTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),

        // Preset options as a wrap of selectable chips
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: EncodingPreset.values.map((preset) {
            return _OptionChip(
              label: preset.label,
              isSelected: state.encodingPreset == preset,
              isLocked: isLocked,
              onTap: () => cubit.updateEncodingPreset(preset),
            );
          }).toList(),
        ),

        const SizedBox(height: 6),

        // Description of selected preset
        _InfoBox(
          label: state.encodingPreset.label,
          description: state.encodingPreset.description,
          icon: Icons.speed_rounded,
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

class _OptionChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final bool isLocked;
  final VoidCallback onTap;

  const _OptionChip({
    required this.label,
    required this.isSelected,
    required this.isLocked,
    required this.onTap,
  });

  @override
  State<_OptionChip> createState() => _OptionChipState();
}

class _OptionChipState extends State<_OptionChip> {
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
            widget.label,
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

/// Section for selecting the Video Codec.
class _CodecSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _CodecSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppStrings.videoCodecTitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: VideoCodec.values.map((codec) {
            return _OptionChip(
              label: codec.label,
              isSelected: state.videoCodec == codec,
              isLocked: isLocked,
              onTap: () => cubit.updateVideoCodec(codec),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.videoCodec.label,
          description: state.videoCodec.description,
          icon: Icons.movie_creation_rounded,
        ),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: isLocked ? null : () => cubit.toggleVideoDenoise(!state.enableVideoDenoise),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: state.enableVideoDenoise
                  ? theme.colorScheme.primary.withValues(alpha: 0.1)
                  : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: state.enableVideoDenoise
                    ? theme.colorScheme.primary
                    : theme.dividerColor.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.auto_fix_high_rounded,
                  size: 20,
                  color: state.enableVideoDenoise
                      ? theme.colorScheme.primary
                      : theme.iconTheme.color,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.enableVideoDenoiseTitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: state.enableVideoDenoise
                              ? theme.colorScheme.primary
                              : theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                      Text(
                        AppStrings.enableVideoDenoiseDesc,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: state.enableVideoDenoise,
                  onChanged: isLocked
                      ? null
                      : (val) => cubit.toggleVideoDenoise(val),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Section for selecting Hardware Encoder.
class _HardwareEncoderSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _HardwareEncoderSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppStrings.hardwareEncoderTitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: HardwareEncoder.values.map((enc) {
            return _OptionChip(
              label: enc.label,
              isSelected: state.hardwareEncoder == enc,
              isLocked: isLocked,
              onTap: () => cubit.updateHardwareEncoder(enc),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.hardwareEncoder.label,
          description: state.hardwareEncoder.description,
          icon: Icons.memory_rounded,
        ),
      ],
    );
  }
}

/// Section for selecting the Audio Mode.
class _AudioModeSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _AudioModeSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.audioModeTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: AudioMode.values.map((mode) {
            return _OptionChip(
              label: mode.label,
              isSelected: state.audioMode == mode,
              isLocked: isLocked,
              onTap: () => cubit.updateAudioMode(mode),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.audioMode.label,
          description: state.audioMode.description,
          icon: Icons.graphic_eq_rounded,
        ),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: isLocked ? null : () => cubit.toggleAudioDenoise(!state.enableAudioDenoise),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: state.enableAudioDenoise
                  ? theme.colorScheme.primary.withValues(alpha: 0.1)
                  : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: state.enableAudioDenoise
                    ? theme.colorScheme.primary
                    : theme.dividerColor.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.noise_control_off_rounded,
                  size: 20,
                  color: state.enableAudioDenoise
                      ? theme.colorScheme.primary
                      : theme.iconTheme.color,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.enableAudioDenoiseTitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: state.enableAudioDenoise
                              ? theme.colorScheme.primary
                              : theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                      Text(
                        AppStrings.enableAudioDenoiseDesc,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: state.enableAudioDenoise,
                  onChanged: isLocked
                      ? null
                      : (val) => cubit.toggleAudioDenoise(val),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Section for selecting the Resolution Mode.
class _ResolutionSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _ResolutionSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.resolutionTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: ResolutionMode.values.map((mode) {
            return _OptionChip(
              label: mode.label,
              isSelected: state.resolutionMode == mode,
              isLocked: isLocked,
              onTap: () => cubit.updateResolutionMode(mode),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.resolutionMode.label,
          description: state.resolutionMode.description,
          icon: Icons.aspect_ratio_rounded,
        ),
      ],
    );
  }
}

/// Section for selecting Frame Rate.
class _FrameRateSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _FrameRateSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.frameRateTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: FrameRateMode.values.map((mode) {
            return _OptionChip(
              label: mode.label,
              isSelected: state.frameRateMode == mode,
              isLocked: isLocked,
              onTap: () => cubit.updateFrameRateMode(mode),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.frameRateMode.label,
          description: state.frameRateMode.description,
          icon: Icons.burst_mode_rounded,
        ),
      ],
    );
  }
}

/// Section for selecting Output Format (Container).
class _OutputFormatSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _OutputFormatSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.outputFormatTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: OutputFormat.values.map((format) {
            return _OptionChip(
              label: format.label,
              isSelected: state.outputFormat == format,
              isLocked: isLocked,
              onTap: () => cubit.updateOutputFormat(format),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.outputFormat.label,
          description: state.outputFormat.description,
          icon: Icons.insert_drive_file_rounded,
        ),
      ],
    );
  }
}

/// A reusable info box widget for displaying setting descriptions.
class _InfoBox extends StatelessWidget {
  final String label;
  final String description;
  final IconData icon;

  const _InfoBox({
    required this.label,
    required this.description,
    this.icon = Icons.info_outline_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
          Icon(icon, size: 14, color: theme.colorScheme.primary),
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
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: description,
                    style: TextStyle(color: theme.textTheme.bodySmall?.color),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

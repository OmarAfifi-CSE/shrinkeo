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
        // Mode Selector: Quality (CRF) vs Target Size (MB)
        Row(
          children: [
            _OptionChip(
              label: AppStrings.modeCrfLabel,
              isSelected: !state.isTargetSizeMode,
              isLocked: isLocked,
              onTap: () => cubit.toggleTargetSizeMode(false),
            ),
            const SizedBox(width: 8),
            _OptionChip(
              label: AppStrings.modeTargetSizeLabel,
              isSelected: state.isTargetSizeMode,
              isLocked: isLocked,
              onTap: () => cubit.toggleTargetSizeMode(true),
            ),
          ],
        ),
        const SizedBox(height: 12),

        if (!state.isTargetSizeMode) ...[
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
        ] else ...[
          // Target File Size (MB) Presets & Custom Input
          Text(
            AppStrings.targetSizeLabel,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [8.0, 25.0, 50.0, 100.0, 500.0].map((mb) {
                    final isSelected = (state.targetSizeMB - mb).abs() < 0.1;
                    return _OptionChip(
                      label: '${mb.toInt()} MB',
                      isSelected: isSelected,
                      isLocked: isLocked,
                      onTap: () => cubit.updateTargetSizeMB(mb),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 8),
              _CustomSizeInput(
                targetSizeMB: state.targetSizeMB,
                isLocked: isLocked,
                onChanged: (val) => cubit.updateTargetSizeMB(val),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _InfoBox(
            label: '${state.targetSizeMB.toStringAsFixed(state.targetSizeMB.truncateToDouble() == state.targetSizeMB ? 0 : 1)} MB Limit',
            description: AppStrings.targetSizeDesc,
            icon: Icons.track_changes_rounded,
          ),
        ],
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

/// Custom numeric input for target size in MB.
class _CustomSizeInput extends StatefulWidget {
  final double targetSizeMB;
  final bool isLocked;
  final ValueChanged<double> onChanged;

  const _CustomSizeInput({
    required this.targetSizeMB,
    required this.isLocked,
    required this.onChanged,
  });

  @override
  State<_CustomSizeInput> createState() => _CustomSizeInputState();
}

class _CustomSizeInputState extends State<_CustomSizeInput> {
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _formatValue(widget.targetSizeMB));
  }

  @override
  void didUpdateWidget(covariant _CustomSizeInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetSizeMB != widget.targetSizeMB) {
      final formatted = _formatValue(widget.targetSizeMB);
      if (_controller.text != formatted) {
        _controller.text = formatted;
      }
    }
  }

  String _formatValue(double val) {
    return val.toStringAsFixed(val.truncateToDouble() == val ? 0 : 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

    final isPreset = [8.0, 25.0, 50.0, 100.0, 500.0].any((mb) => (widget.targetSizeMB - mb).abs() < 0.1);
    final isCustomActive = _isFocused || !isPreset;

    return Focus(
      onFocusChange: (focused) {
        setState(() => _isFocused = focused);
        if (!focused) {
          final cubit = context.read<CompressionCubit>();
          final minLimit = cubit.minAchievableTargetSizeMB;
          final parsed = double.tryParse(_controller.text);
          if (parsed == null || parsed < minLimit) {
            final formatted = _formatValue(minLimit);
            _controller.text = formatted;
            widget.onChanged(minLimit);
          }
        }
      },
      child: Tooltip(
        message: 'Type custom MB size',
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 96,
          height: 33,
          decoration: BoxDecoration(
            color: isCustomActive
                ? activeColor.withValues(alpha: 0.15)
                : inactiveBorder.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isCustomActive
                  ? activeColor.withValues(alpha: 0.6)
                  : inactiveBorder.withValues(alpha: 0.4),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.edit_rounded,
                size: 12,
                color: isCustomActive
                    ? activeColor
                    : theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: TextField(
                  controller: _controller,
                  enabled: !widget.isLocked,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isCustomActive ? activeColor : theme.textTheme.bodyMedium?.color,
                  ),
                  onChanged: (val) {
                    final parsed = double.tryParse(val);
                    if (parsed != null && parsed >= 1.0 && parsed <= 10000.0) {
                      widget.onChanged(parsed);
                    }
                  },
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 6),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Text(
                'MB',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: isCustomActive
                      ? activeColor
                      : theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.videoCodecTitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
            _DenoiseBadgeChip(
              label: 'Clean Noise',
              icon: Icons.auto_fix_high_rounded,
              isEnabled: state.enableVideoDenoise,
              isLocked: isLocked,
              tooltip: AppStrings.enableVideoDenoiseDesc,
              onTap: () => cubit.toggleVideoDenoise(!state.enableVideoDenoise),
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

/// Section for selecting the Audio Track Mode.
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.audioModeTitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
            _DenoiseBadgeChip(
              label: 'Remove Noise',
              icon: Icons.graphic_eq_rounded,
              isEnabled: state.enableAudioDenoise,
              isLocked: isLocked,
              tooltip: AppStrings.enableAudioDenoiseDesc,
              onTap: () => cubit.toggleAudioDenoise(!state.enableAudioDenoise),
            ),
          ],
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
          icon: Icons.audiotrack_rounded,
        ),
      ],
    );
  }
}

/// Section for selecting Audio Volume Normalization.
class _AudioNormalizeSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _AudioNormalizeSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.audioNormTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: AudioNormalizeMode.values.map((mode) {
            return _OptionChip(
              label: mode.label,
              isSelected: state.audioNormalizeMode == mode,
              isLocked: isLocked,
              onTap: () => cubit.updateAudioNormalizeMode(mode),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.audioNormalizeMode.label,
          description: state.audioNormalizeMode.description,
          icon: Icons.volume_up_rounded,
        ),
      ],
    );
  }
}

/// Section for selecting Audio Channels Downmixing.
class _AudioChannelsSection extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _AudioChannelsSection({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.audioChanTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: AudioChannelsMode.values.map((mode) {
            return _OptionChip(
              label: mode.label,
              isSelected: state.audioChannelsMode == mode,
              isLocked: isLocked,
              onTap: () => cubit.updateAudioChannelsMode(mode),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: state.audioChannelsMode.label,
          description: state.audioChannelsMode.description,
          icon: Icons.surround_sound_rounded,
        ),
      ],
    );
  }
}

/// Compact inline badge toggle chip for Denoise settings.
class _DenoiseBadgeChip extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isEnabled;
  final bool isLocked;
  final String tooltip;
  final VoidCallback onTap;

  const _DenoiseBadgeChip({
    required this.label,
    required this.icon,
    required this.isEnabled,
    required this.isLocked,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_DenoiseBadgeChip> createState() => _DenoiseBadgeChipState();
}

class _DenoiseBadgeChipState extends State<_DenoiseBadgeChip> {
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

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        cursor: widget.isLocked
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.isLocked ? null : widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: widget.isEnabled
                  ? activeColor.withValues(alpha: 0.18)
                  : _isHovering && !widget.isLocked
                  ? activeColor.withValues(alpha: 0.08)
                  : inactiveBorder.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: widget.isEnabled
                    ? activeColor
                    : _isHovering && !widget.isLocked
                    ? activeColor.withValues(alpha: 0.4)
                    : inactiveBorder.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 11,
                  color: widget.isEnabled
                      ? activeColor
                      : theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                ),
                const SizedBox(width: 4),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.isEnabled
                        ? activeColor
                        : theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                    fontSize: 10,
                    fontWeight: widget.isEnabled ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                    color: widget.isEnabled
                        ? activeColor
                        : inactiveBorder.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.isEnabled ? 'ON' : 'OFF',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                      color: widget.isEnabled
                          ? Colors.white
                          : theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

/// Tools & Editing Tab Content
class _ToolsTabContent extends StatelessWidget {
  final CompressionState state;
  final bool isLocked;

  const _ToolsTabContent({required this.state, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      key: const ValueKey('tab_tools'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row 1: Export Format (1 line) & Privacy Scrubbing (1 line)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Export Format',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: ExportType.values.map((type) {
                      String label;
                      if (type == ExportType.video) {
                        label = '🎥 Video';
                      } else if (type == ExportType.gif) {
                        label = '🖼️ GIF';
                      } else if (type == ExportType.mp3) {
                        label = '🎵 MP3';
                      } else if (type == ExportType.aac) {
                        label = '🎼 AAC';
                      } else {
                        label = '🎧 WAV';
                      }
                      return _OptionChip(
                        label: label,
                        isSelected: state.exportType == type,
                        isLocked: isLocked,
                        onTap: () => cubit.updateExportType(type),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 6),
                  _InfoBox(
                    label: state.exportType.label,
                    description: state.exportType.description,
                    icon: state.exportType == ExportType.video
                        ? Icons.movie_creation_rounded
                        : state.exportType == ExportType.gif
                            ? Icons.gif_box_rounded
                            : Icons.audiotrack_rounded,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy & GPS Scrubbing',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      _OptionChip(
                        label: 'Keep Metadata',
                        isSelected: !state.stripMetadata,
                        isLocked: isLocked,
                        onTap: () => cubit.toggleStripMetadata(false),
                      ),
                      _OptionChip(
                        label: '🛡️ Strip GPS/EXIF',
                        isSelected: state.stripMetadata,
                        isLocked: isLocked,
                        onTap: () => cubit.toggleStripMetadata(true),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  _InfoBox(
                    label: state.stripMetadata ? 'Strip GPS & Metadata' : 'Keep Metadata',
                    description: state.stripMetadata
                        ? 'Removes camera info, GPS location, & timestamps.'
                        : 'Preserves original video EXIF metadata.',
                    icon: Icons.shield_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Row 2: Auto-Crop Black Bars (1 line) & Playback Speed (1 line)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Auto-Crop Black Bars',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      _OptionChip(
                        label: 'Disabled',
                        isSelected: !state.autoCropBlackBars,
                        isLocked: isLocked,
                        onTap: () => cubit.toggleAutoCropBlackBars(false),
                      ),
                      _OptionChip(
                        label: '✂️ Auto-Crop',
                        isSelected: state.autoCropBlackBars,
                        isLocked: isLocked,
                        onTap: () => cubit.toggleAutoCropBlackBars(true),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  _InfoBox(
                    label: state.autoCropBlackBars ? 'Auto-Crop Active' : 'Disabled',
                    description: state.autoCropBlackBars
                        ? 'Removes black letterbox borders from video.'
                        : 'Keeps original video frame borders.',
                    icon: Icons.crop_free_rounded,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Playback Speed',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: VideoSpeedMode.values.map((mode) {
                      String label;
                      if (mode == VideoSpeedMode.original) {
                        label = '1.0x';
                      } else if (mode == VideoSpeedMode.slow05) {
                        label = '0.5x Slow';
                      } else if (mode == VideoSpeedMode.fast15) {
                        label = '1.5x';
                      } else if (mode == VideoSpeedMode.fast20) {
                        label = '2.0x Fast';
                      } else {
                        label = '4.0x Lapse';
                      }
                      return _OptionChip(
                        label: label,
                        isSelected: state.videoSpeedMode == mode,
                        isLocked: isLocked,
                        onTap: () => cubit.updateVideoSpeedMode(mode),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 6),
                  _InfoBox(
                    label: state.videoSpeedMode.label,
                    description: state.videoSpeedMode.description,
                    icon: Icons.speed_rounded,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Row 3: Canvas Aspect Ratio (2 lines) & Rotation & Flip (2 lines)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Canvas Aspect Ratio',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: AspectRatioMode.values.map((mode) {
                      return _OptionChip(
                        label: mode.label,
                        isSelected: state.aspectRatioMode == mode,
                        isLocked: isLocked,
                        onTap: () => cubit.updateAspectRatioMode(mode),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 6),
                  _InfoBox(
                    label: state.aspectRatioMode.label,
                    description: state.aspectRatioMode.description,
                    icon: Icons.crop_rounded,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rotation & Flip',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: VideoRotationMode.values.map((mode) {
                      return _OptionChip(
                        label: mode.label,
                        isSelected: state.videoRotationMode == mode,
                        isLocked: isLocked,
                        onTap: () => cubit.updateVideoRotationMode(mode),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 6),
                  _InfoBox(
                    label: state.videoRotationMode.label,
                    description: state.videoRotationMode.description,
                    icon: Icons.rotate_right_rounded,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Row 4: Lossless Cut / Trim Video
        _TrimSection(state: state, isLocked: isLocked),
      ],
    );
  }
}

class _TrimSection extends StatefulWidget {
  final CompressionState state;
  final bool isLocked;

  const _TrimSection({required this.state, required this.isLocked});

  @override
  State<_TrimSection> createState() => _TrimSectionState();
}

class _TrimSectionState extends State<_TrimSection> {
  late TextEditingController _startController;
  late TextEditingController _endController;
  final FocusNode _startFocusNode = FocusNode();
  final FocusNode _endFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _startController = TextEditingController(text: widget.state.trimStartTime);
    _endController = TextEditingController(text: widget.state.trimEndTime);
  }

  @override
  void didUpdateWidget(covariant _TrimSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_startFocusNode.hasFocus &&
        oldWidget.state.trimStartTime != widget.state.trimStartTime) {
      if (_startController.text != widget.state.trimStartTime) {
        _startController.text = widget.state.trimStartTime;
      }
    }
    if (!_endFocusNode.hasFocus &&
        oldWidget.state.trimEndTime != widget.state.trimEndTime) {
      if (_endController.text != widget.state.trimEndTime) {
        _endController.text = widget.state.trimEndTime;
      }
    }
  }

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    _startFocusNode.dispose();
    _endFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lossless Cut / Trim Video',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _OptionChip(
              label: 'Full Video',
              isSelected: !widget.state.trimEnabled,
              isLocked: widget.isLocked,
              onTap: () => cubit.toggleTrim(false),
            ),
            const SizedBox(width: 6),
            _OptionChip(
              label: 'Cut Clip (Trim)',
              isSelected: widget.state.trimEnabled,
              isLocked: widget.isLocked,
              onTap: () => cubit.toggleTrim(true),
            ),
            if (widget.state.trimEnabled) ...[
              const SizedBox(width: 10),
              _TrimTimeInput(
                label: 'Start',
                controller: _startController,
                focusNode: _startFocusNode,
                isLocked: widget.isLocked,
                onChanged: (val) => cubit.updateTrimStartTime(val),
              ),
              const SizedBox(width: 8),
              _TrimTimeInput(
                label: 'End',
                controller: _endController,
                focusNode: _endFocusNode,
                isLocked: widget.isLocked,
                onChanged: (val) => cubit.updateTrimEndTime(val),
              ),
            ],
          ],
        ),
        const SizedBox(height: 6),
        _InfoBox(
          label: widget.state.trimEnabled ? 'Trim Active' : 'Full Video',
          description: widget.state.trimEnabled
              ? 'Losslessly cuts the video clip between ${widget.state.trimStartTime} and ${widget.state.trimEndTime}.'
              : 'Processes the entire video duration without trimming.',
          icon: Icons.content_cut_rounded,
        ),
      ],
    );
  }
}

/// Compact inline text input for trim Start and End times with smart auto-formatting.
class _TrimTimeInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isLocked;
  final ValueChanged<String> onChanged;

  const _TrimTimeInput({
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.isLocked,
    required this.onChanged,
  });

  @override
  State<_TrimTimeInput> createState() => _TrimTimeInputState();
}

class _TrimTimeInputState extends State<_TrimTimeInput> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    if (!widget.focusNode.hasFocus) {
      // Auto-format input to HH:MM:SS on blur (e.g. "5" -> "00:00:05", "1:30" -> "00:01:30")
      final formatted = _formatTimestamp(widget.controller.text);
      if (widget.controller.text != formatted) {
        widget.controller.text = formatted;
      }
      widget.onChanged(formatted);
    }
  }

  static String _formatTimestamp(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) return '00:00:00';

    // HH:MM:SS
    final hhmmss = RegExp(r'^(\d{1,2}):(\d{1,2}):(\d{1,2})$').firstMatch(trimmed);
    if (hhmmss != null) {
      final h = int.parse(hhmmss.group(1)!).toString().padLeft(2, '0');
      final m = int.parse(hhmmss.group(2)!).toString().padLeft(2, '0');
      final s = int.parse(hhmmss.group(3)!).toString().padLeft(2, '0');
      return '$h:$m:$s';
    }

    // MM:SS
    final mmss = RegExp(r'^(\d{1,2}):(\d{1,2})$').firstMatch(trimmed);
    if (mmss != null) {
      final m = int.parse(mmss.group(1)!).toString().padLeft(2, '0');
      final s = int.parse(mmss.group(2)!).toString().padLeft(2, '0');
      return '00:$m:$s';
    }

    // Pure number (seconds)
    final seconds = int.tryParse(trimmed);
    if (seconds != null) {
      final h = seconds ~/ 3600;
      final m = (seconds % 3600) ~/ 60;
      final s = seconds % 60;
      return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }

    return trimmed;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final activeColor = isDark
        ? AppColors.primaryAccentLight
        : AppColors.primaryAccent;

    return Tooltip(
      message: 'Enter time e.g. 5 (5s), 1:30 (1m30s), or 00:01:30',
      child: Container(
        width: 120,
        height: 33,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: activeColor.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: activeColor.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          children: [
            Text(
              '${widget.label}:',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: activeColor,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                enabled: !widget.isLocked,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyMedium?.color,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: '00:00:00',
                ),
                onChanged: widget.onChanged,
                onSubmitted: (val) {
                  final formatted = _formatTimestamp(val);
                  widget.controller.text = formatted;
                  widget.onChanged(formatted);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

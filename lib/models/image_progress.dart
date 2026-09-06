import 'package:equatable/equatable.dart';

enum ImageStage { preparing, encoding, saving }

/// Progress of the current stage, never an estimate of total elapsed time.
class ImageProgress extends Equatable {
  final ImageStage stage;
  final double? fraction;
  final int? attempt;
  final int? bestBytes;
  final double? targetKB;

  const ImageProgress({
    this.stage = ImageStage.preparing,
    this.fraction,
    this.attempt,
    this.bestBytes,
    this.targetKB,
  });

  @override
  List<Object?> get props => [stage, fraction, attempt, bestBytes, targetKB];
}

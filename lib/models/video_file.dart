import 'package:equatable/equatable.dart';

/// Status of an individual video in the compression queue.
enum VideoStatus { queued, probing, compressing, success, failed, cancelled }

/// Set of valid video file extensions accepted by the application.
const Set<String> validVideoExtensions = {
  '.mp4',
  '.mkv',
  '.mov',
  '.avi',
  '.wmv',
};

/// Immutable model representing a single video file in the compression queue.
class VideoFile extends Equatable {
  /// Unique identifier (derived from path hash + timestamp).
  final String id;

  /// Absolute path to the source video file.
  final String filePath;

  /// Display-friendly file name (basename).
  final String fileName;

  /// File extension including dot (e.g., ".mp4").
  final String extension;

  /// Original file size in bytes.
  final int fileSizeBytes;

  /// Total duration of the video (populated after ffprobe).
  final Duration? totalDuration;

  /// Current processing status.
  final VideoStatus status;

  /// Compression progress from 0.0 to 1.0.
  final double progress;

  /// Absolute path to the compressed output file.
  final String? outputPath;

  /// Compressed file size in bytes (populated after success).
  final int? outputSizeBytes;

  /// Current temporary output size in bytes (updated during compression).
  final int? currentOutputSizeBytes;

  /// Whether a warning has been shown that the output is larger than the original.
  final bool hasWarnedLargerSize;

  /// Error message (populated on failure).
  final String? errorMessage;

  /// Absolute path to a generated thumbnail image.
  final String? thumbnailPath;

  /// Estimated time remaining for compression.
  final Duration? eta;

  /// Current processing speed multiplier (e.g., 1.5 for 1.5x speed).
  final double? processingSpeed;

  const VideoFile({
    required this.id,
    required this.filePath,
    required this.fileName,
    required this.extension,
    required this.fileSizeBytes,
    this.totalDuration,
    this.status = VideoStatus.queued,
    this.progress = 0.0,
    this.outputPath,
    this.outputSizeBytes,
    this.currentOutputSizeBytes,
    this.hasWarnedLargerSize = false,
    this.errorMessage,
    this.thumbnailPath,
    this.eta,
    this.processingSpeed,
  });

  /// Creates a copy with the given fields overridden.
  VideoFile copyWith({
    String? id,
    String? filePath,
    String? fileName,
    String? extension,
    int? fileSizeBytes,
    Duration? totalDuration,
    VideoStatus? status,
    double? progress,
    String? outputPath,
    int? outputSizeBytes,
    int? currentOutputSizeBytes,
    bool? hasWarnedLargerSize,
    String? errorMessage,
    String? thumbnailPath,
    Duration? eta,
    double? processingSpeed,
    // Allow explicitly setting nullable fields to null.
    bool clearTotalDuration = false,
    bool clearOutputPath = false,
    bool clearOutputSizeBytes = false,
    bool clearCurrentOutputSizeBytes = false,
    bool clearHasWarnedLargerSize = false,
    bool clearErrorMessage = false,
    bool clearThumbnailPath = false,
    bool clearEta = false,
    bool clearProcessingSpeed = false,
  }) {
    return VideoFile(
      id: id ?? this.id,
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      extension: extension ?? this.extension,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      totalDuration: clearTotalDuration
          ? null
          : (totalDuration ?? this.totalDuration),
      status: status ?? this.status,
      progress: progress ?? this.progress,
      outputPath: clearOutputPath ? null : (outputPath ?? this.outputPath),
      outputSizeBytes: clearOutputSizeBytes
          ? null
          : (outputSizeBytes ?? this.outputSizeBytes),
      currentOutputSizeBytes: clearCurrentOutputSizeBytes
          ? null
          : (currentOutputSizeBytes ?? this.currentOutputSizeBytes),
      hasWarnedLargerSize: clearHasWarnedLargerSize 
          ? false 
          : (hasWarnedLargerSize ?? this.hasWarnedLargerSize),
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
      thumbnailPath: clearThumbnailPath
          ? null
          : (thumbnailPath ?? this.thumbnailPath),
      eta: clearEta ? null : (eta ?? this.eta),
      processingSpeed: clearProcessingSpeed
          ? null
          : (processingSpeed ?? this.processingSpeed),
    );
  }

  /// Checks whether [ext] is a valid video file extension.
  static bool isValidVideoExtension(String ext) {
    return validVideoExtensions.contains(ext.toLowerCase());
  }

  /// Formats byte sizes into human-readable strings (e.g., "12.5 MB").
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  /// Returns the compression ratio as a percentage string (e.g., "-42%").
  String? get compressionRatio {
    if (outputSizeBytes == null || fileSizeBytes == 0) return null;
    final ratio = ((fileSizeBytes - outputSizeBytes!) / fileSizeBytes * 100)
        .round();
    return '-$ratio%';
  }

  @override
  List<Object?> get props => [
        id,
        filePath,
        fileName,
        extension,
        fileSizeBytes,
        totalDuration,
        status,
        progress,
        outputPath,
        outputSizeBytes,
        currentOutputSizeBytes,
        hasWarnedLargerSize,
        errorMessage,
        thumbnailPath,
        eta,
        processingSpeed,
      ];
}

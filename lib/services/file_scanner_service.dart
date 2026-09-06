import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

import '../models/file_item.dart';

/// Service responsible for scanning file paths and filtering valid video files.
class FileScannerService {
  /// Scans a list of file/directory paths and returns only valid video file paths.
  ///
  /// - If a path points to a directory, it is recursively scanned for video files.
  /// - If a path points to a file, it is included only if it has a valid video extension.
  /// - Non-video files and unreadable paths are silently ignored.
  /// - Results are deduplicated by absolute path.
  Future<List<String>> scanPaths(List<String> paths) async {
    final Set<String> videoPaths = {};

    for (final path in paths) {
      try {
        final entityType = await FileSystemEntity.type(path);

        if (entityType == FileSystemEntityType.directory) {
          // Recursively scan directory for video files.
          await _scanDirectory(Directory(path), videoPaths);
        } else if (entityType == FileSystemEntityType.file) {
          _addIfVideo(path, videoPaths);
        }
        // Silently ignore links, notFound, and other entity types.
      } catch (e) {
        debugPrint('FileScannerService: Error scanning path "$path": $e');
      }
    }

    return videoPaths.toList();
  }

  /// Recursively scans [directory] and adds valid video file paths to [results].
  Future<void> _scanDirectory(Directory directory, Set<String> results) async {
    try {
      await for (final entity in directory.list(
        recursive: true,
        followLinks: false,
      )) {
        if (entity is File) {
          _addIfVideo(entity.path, results);
        }
      }
    } catch (e) {
      debugPrint('FileScannerService: Error accessing directory "${directory.path}": $e');
    }
  }

  /// Adds [filePath] to [results] if it has a valid video or image media extension.
  void _addIfVideo(String filePath, Set<String> results) {
    final ext = p.extension(filePath).toLowerCase();
    if (VideoFile.isValidMediaExtension(ext)) {
      results.add(p.normalize(filePath));
    }
  }
}

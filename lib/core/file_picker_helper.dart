import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import '../models/file_item.dart';

/// Centralized helper for opening native file and folder pickers.
///
/// Encapsulates platform exception handling and prevents code duplication
/// across drop zones, queue views, and settings panels.
class FilePickerHelper {
  const FilePickerHelper._();

  /// Prompts the user to select one or multiple media files (videos or images).
  ///
  /// Returns a list of absolute paths, or an empty list if cancelled/failed.
  static Future<List<String>> pickMultipleMediaFiles() async {
    try {
      final files = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: VideoFile.pickerExtensions,
      );

      if (files.isNotEmpty) {
        return files
            .where((f) => f.path != null)
            .map((f) => f.path!)
            .toList();
      }
    } catch (e, st) {
      debugPrint('FilePickerHelper: pickMultipleMediaFiles error: $e\n$st');
    }
    return const [];
  }

  /// Prompts the user to select a directory.
  ///
  /// Returns the absolute directory path, or `null` if cancelled/failed.
  static Future<String?> pickDirectory() async {
    try {
      return await FilePicker.getDirectoryPath();
    } catch (e, st) {
      debugPrint('FilePickerHelper: pickDirectory error: $e\n$st');
      return null;
    }
  }
}

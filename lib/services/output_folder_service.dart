import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Service responsible for creating the output folder for compressed videos.
///
/// Uses an auto-increment naming algorithm to prevent overwriting:
/// - First attempt: `Shrinkeo Output`
/// - If exists: `Shrinkeo Output_1`, `Shrinkeo Output_2`, etc.
class OutputFolderService {
  static const String _baseFolderName = 'Shrinkeo Output';

  /// Resolves and creates a unique output folder inside [sourceDirectory].
  ///
  /// Returns the absolute path to the created output folder. If permission is denied,
  /// it falls back to the user's Downloads directory.
  Future<String> resolveOutputFolder(String sourceDirectory) async {
    try {
      return await _createUniqueFolder(sourceDirectory);
    } catch (e) {
      debugPrint('Failed to create output folder in $sourceDirectory: $e. Falling back to Downloads.');
      try {
        final downloadsDir = await getDownloadsDirectory();
        if (downloadsDir != null) {
          return await _createUniqueFolder(downloadsDir.path);
        }
      } catch (e) {
        debugPrint('Downloads fallback failed too: $e. Using system temp.');
      }

      // Ultimate fallback
      return await _createUniqueFolder(Directory.systemTemp.path);
    }
  }

  Future<String> _createUniqueFolder(String basePath) async {
    String folderPath = p.join(basePath, _baseFolderName);

    if (!await Directory(folderPath).exists()) {
      await Directory(folderPath).create(recursive: true);
      return folderPath;
    }

    // Auto-increment until we find a name that doesn't exist.
    int counter = 1;
    while (true) {
      folderPath = p.join(basePath, '${_baseFolderName}_$counter');
      if (!await Directory(folderPath).exists()) {
        await Directory(folderPath).create(recursive: true);
        return folderPath;
      }
      counter++;
    }
  }
}

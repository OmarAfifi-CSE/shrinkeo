import 'dart:io';

import 'package:path/path.dart' as p;

/// Service responsible for creating the output folder for compressed videos.
///
/// Uses an auto-increment naming algorithm to prevent overwriting:
/// - First attempt: `Compressed_Videos`
/// - If exists: `Compressed_Videos_1`, `Compressed_Videos_2`, etc.
class OutputFolderService {
  static const String _baseFolderName = 'Compressed_Videos';

  /// Resolves and creates a unique output folder inside [sourceDirectory].
  ///
  /// Returns the absolute path to the created output folder.
  Future<String> resolveOutputFolder(String sourceDirectory) async {
    String folderPath = p.join(sourceDirectory, _baseFolderName);

    if (!await Directory(folderPath).exists()) {
      await Directory(folderPath).create(recursive: true);
      return folderPath;
    }

    // Auto-increment until we find a name that doesn't exist.
    int counter = 1;
    while (true) {
      folderPath = p.join(sourceDirectory, '${_baseFolderName}_$counter');
      if (!await Directory(folderPath).exists()) {
        await Directory(folderPath).create(recursive: true);
        return folderPath;
      }
      counter++;
    }
  }
}

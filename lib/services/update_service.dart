import 'dart:convert';
import 'dart:developer' as dev;

import 'package:http/http.dart' as http;

/// Information about an available update.
class UpdateInfo {
  /// The latest version string (e.g., "1.2.0").
  final String latestVersion;

  /// Direct download URL for the update package.
  final String downloadUrl;

  /// Optional release notes / changelog.
  final String? releaseNotes;

  const UpdateInfo({
    required this.latestVersion,
    required this.downloadUrl,
    this.releaseNotes,
  });
}

/// Placeholder update service that checks for application and FFmpeg updates.
///
/// ## How to integrate your own backend:
///
/// 1. Replace [_appUpdateUrl] with your GitHub Releases API endpoint
///    (e.g., `https://api.github.com/repos/YourUser/Shrinkeo/releases/latest`)
///    or your personal backend URL.
///
/// 2. Replace [_ffmpegPatchUrl] with your FFmpeg binary patch endpoint.
///
/// 3. Implement the JSON parsing logic in [checkForAppUpdate] and
///    [checkForFfmpegPatch] to match your API response format.
class UpdateService {
  // ---------------------------------------------------------------------------
  // TODO: Replace these URLs with your actual endpoints.
  // ---------------------------------------------------------------------------

  /// URL to check for the latest app version.
  /// Example: 'https://api.github.com/repos/YOUR_USER/shrinkeo/releases/latest'
  static const String _appUpdateUrl =
      'https://api.github.com/repos/YOUR_USER/YOUR_REPO/releases/latest';

  /// URL to check for FFmpeg binary patches.
  /// Example: 'https://your-backend.com/api/ffmpeg/latest'
  static const String _ffmpegPatchUrl =
      'https://your-backend.com/api/ffmpeg/latest';

  final http.Client _client;

  UpdateService({http.Client? client}) : _client = client ?? http.Client();

  /// Checks if a newer version of the application is available.
  ///
  /// Returns an [UpdateInfo] if an update is available, or `null` if
  /// the app is up-to-date or the check fails.
  ///
  /// [currentVersion] should be the current app version string (e.g., "1.0.0").
  Future<UpdateInfo?> checkForAppUpdate(String currentVersion) async {
    try {
      final response = await _client
          .get(
            Uri.parse(_appUpdateUrl),
            headers: {'Accept': 'application/vnd.github.v3+json'},
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        dev.log(
          'Update check failed: HTTP ${response.statusCode}',
          name: 'UpdateService',
        );
        return null;
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      // ---------------------------------------------------------------------------
      // TODO: Parse your API response here.
      //
      // GitHub Releases API example:
      //   final latestVersion = (json['tag_name'] as String).replaceFirst('v', '');
      //   final downloadUrl = json['assets'][0]['browser_download_url'] as String;
      //   final releaseNotes = json['body'] as String?;
      //
      //   if (_isNewerVersion(latestVersion, currentVersion)) {
      //     return UpdateInfo(
      //       latestVersion: latestVersion,
      //       downloadUrl: downloadUrl,
      //       releaseNotes: releaseNotes,
      //     );
      //   }
      // ---------------------------------------------------------------------------

      // Placeholder: always returns null (no update available).
      dev.log(
        'Update check completed. Response keys: ${json.keys.toList()}',
        name: 'UpdateService',
      );
      return null;
    } catch (e) {
      dev.log(
        'Update check error: $e',
        name: 'UpdateService',
      );
      return null;
    }
  }

  /// Checks if a newer FFmpeg binary patch is available.
  ///
  /// Returns the download URL string if a patch is available, or `null`
  /// if FFmpeg is up-to-date or the check fails.
  ///
  /// [currentFfmpegVersion] should be the current bundled FFmpeg version.
  Future<String?> checkForFfmpegPatch(String currentFfmpegVersion) async {
    try {
      final response = await _client
          .get(Uri.parse(_ffmpegPatchUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        dev.log(
          'FFmpeg patch check failed: HTTP ${response.statusCode}',
          name: 'UpdateService',
        );
        return null;
      }

      // ---------------------------------------------------------------------------
      // TODO: Parse your API response here.
      //
      // Example:
      //   final json = jsonDecode(response.body) as Map<String, dynamic>;
      //   final latestVersion = json['version'] as String;
      //   final downloadUrl = json['download_url'] as String;
      //
      //   if (latestVersion != currentFfmpegVersion) {
      //     return downloadUrl;
      //   }
      // ---------------------------------------------------------------------------

      // Placeholder: always returns null (no patch available).
      dev.log('FFmpeg patch check completed.', name: 'UpdateService');
      return null;
    } catch (e) {
      dev.log(
        'FFmpeg patch check error: $e',
        name: 'UpdateService',
      );
      return null;
    }
  }

  /// Disposes the HTTP client.
  void dispose() {
    _client.close();
  }
}

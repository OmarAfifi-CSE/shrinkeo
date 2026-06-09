import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import '../core/app_constants.dart';
import '../ui/widgets/update_dialog.dart';

class UpdateService {
  /// Fetches releases from GitHub.
  static Future<List<dynamic>?> _fetchReleases() async {
    try {
      final response = await http
          .get(Uri.parse(AppConstants.githubApiUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (_) {}
    return null;
  }

  /// Extracts the download URL for the current platform from the assets list.
  static String? _getDownloadUrlFromAssets(List<dynamic> assets) {
    if (Platform.isWindows) {
      for (var asset in assets) {
        final String name = asset['name']?.toString().toLowerCase() ?? '';
        if (name.endsWith('.exe')) {
          return asset['browser_download_url'];
        }
      }
    }
    return null;
  }

  /// Gets the latest download URL for the current platform from GitHub releases.
  static Future<String?> getLatestDownloadUrl() async {
    final releases = await _fetchReleases();
    if (releases == null || releases.isEmpty) return null;

    final latestRelease = releases.first;
    final List<dynamic> assets = latestRelease['assets'] ?? [];

    return _getDownloadUrlFromAssets(assets);
  }

  /// Checks for updates and shows a dialog if a newer version is available.
  static Future<void> checkForUpdates(BuildContext context) async {
    try {
      final releases = await _fetchReleases();
      if (releases == null || releases.isEmpty) return;

      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final String localVersion = _cleanVersion(packageInfo.version);

      final List<dynamic> newerReleases = releases.where((release) {
        final tag = release['tag_name'] as String?;
        if (tag == null) return false;
        return _isRemoteGreater(localVersion, _cleanVersion(tag));
      }).toList();

      if (newerReleases.isEmpty) return;

      // The first item in the list is the latest release (GitHub sorts by newest first)
      final latestRelease = newerReleases.first;
      final String remoteVersionTag = latestRelease['tag_name'] as String;

      final List<dynamic> assets = latestRelease['assets'] ?? [];
      final String? downloadUrl = _getDownloadUrlFromAssets(assets);

      // If the latest release doesn't contain a file for this platform, ignore the update.
      if (downloadUrl == null) {
        return;
      }

      // Aggregate release notes
      final String aggregatedNotes = _buildReleaseNotes(newerReleases);

      if (!context.mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => UpdateDialog(
          newVersion: remoteVersionTag,
          whatsNew: aggregatedNotes,
          downloadUrl: downloadUrl,
        ),
      );
    } catch (_) {
      // Silently fail if unable to check for updates
    }
  }

  /// Builds a markdown string containing all release notes.
  static String _buildReleaseNotes(List<dynamic> releases) {
    final StringBuffer notes = StringBuffer();
    for (var release in releases) {
      final String tag = release['tag_name'] ?? 'Unknown Version';
      final String body = release['body'] ?? 'No release notes available.';
      notes.writeln('## $tag');
      notes.writeln(body.trim());
      notes.writeln('');
      notes.writeln('---');
      notes.writeln('');
    }
    return notes.toString().trim();
  }

  /// Fetches and returns aggregated release notes for all versions newer than the local version.
  static Future<String?> getAggregatedReleaseNotes() async {
    try {
      final releases = await _fetchReleases();
      if (releases == null || releases.isEmpty) return null;

      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final String localVersion = _cleanVersion(packageInfo.version);

      final List<dynamic> newerReleases = releases.where((release) {
        final tag = release['tag_name'] as String?;
        if (tag == null) return false;
        return _isRemoteGreater(localVersion, _cleanVersion(tag));
      }).toList();

      if (newerReleases.isEmpty) return null;

      return _buildReleaseNotes(newerReleases);
    } catch (_) {
      return null;
    }
  }

  /// Removes common prefixes from a version string (e.g. 'v1.0.0-beta' -> '1.0.0')
  static String _cleanVersion(String version) {
    String cleanStr = version.toLowerCase().trim();
    if (cleanStr.startsWith('v')) {
      cleanStr = cleanStr.substring(1);
    }
    // Remove build numbers if any (e.g. '1.0.0+1' -> '1.0.0')
    if (cleanStr.contains('+')) {
      cleanStr = cleanStr.split('+').first;
    }
    // Remove pre-release tags (e.g. '1.0.0-beta' -> '1.0.0')
    if (cleanStr.contains('-')) {
      cleanStr = cleanStr.split('-').first;
    }
    return cleanStr;
  }

  /// Compares standard semantic versions. Returns true if remote > local.
  static bool _isRemoteGreater(String local, String remote) {
    try {
      List<int> localParts = local
          .split('.')
          .map((e) => int.tryParse(e) ?? 0)
          .toList();
      List<int> remoteParts = remote
          .split('.')
          .map((e) => int.tryParse(e) ?? 0)
          .toList();

      int maxLength = localParts.length > remoteParts.length
          ? localParts.length
          : remoteParts.length;

      for (int i = 0; i < maxLength; i++) {
        int l = i < localParts.length ? localParts[i] : 0;
        int r = i < remoteParts.length ? remoteParts[i] : 0;

        if (r > l) return true;
        if (r < l) return false;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}

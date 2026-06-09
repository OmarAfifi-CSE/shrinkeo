import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import '../core/app_constants.dart';
import '../core/app_strings.dart';
import '../models/remote_config.dart';

class AppBlockState {
  final bool isBlocked;
  final String title;
  final String message;
  final String? updateUrl;
  final bool allowBypass;
  final bool isMaintenance;

  AppBlockState({
    required this.isBlocked,
    this.title = '',
    this.message = '',
    this.updateUrl,
    this.allowBypass = false,
    this.isMaintenance = false,
  });
}

final ValueNotifier<AppBlockState?> globalBlockState = ValueNotifier(null);

class RemoteConfigService {
  static void bypassBlock() {
    globalBlockState.value = AppBlockState(isBlocked: false);
  }

  static Future<AppBlockState> checkBlockState() async {
    try {
      // 1. Fetch remote config with a fast 2-second timeout so offline users aren't delayed
      final response = await http
          .get(Uri.parse(AppConstants.remoteConfigUrl))
          .timeout(const Duration(seconds: 2));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final config = RemoteConfig.fromJson(data);

        // 2. Check Maintenance Mode
        if (config.isMaintenanceActive) {
          return AppBlockState(
            isBlocked: true,
            isMaintenance: true,
            title: AppStrings.maintenanceTitle,
            message: config.maintenanceMessage.isNotEmpty
                ? config.maintenanceMessage
                : AppStrings.maintenanceDescDefault,
          );
        }

        // 3. Check Mandatory Update
        final packageInfo = await PackageInfo.fromPlatform();
        final currentVersion = packageInfo.version; // e.g. "1.0.1"

        if (_isUpdateRequired(currentVersion, config.minVersion)) {
          const isStoreRelease = bool.fromEnvironment(
            'STORE_RELEASE',
            defaultValue: false,
          );
          return AppBlockState(
            isBlocked: true,
            title: AppStrings.updateRequiredTitle,
            message: AppStrings.updateRequiredDescOldVersion,
            updateUrl: isStoreRelease
                ? config.storeUpdateUrl
                : config.githubUpdateUrl,
            allowBypass: config.allowBypass,
          );
        }
      }
    } catch (e) {
      // Ignore network errors or timeouts, just let the app open normally.
    }

    return AppBlockState(isBlocked: false);
  }

  static bool _isUpdateRequired(String current, String min) {
    try {
      final List<int> curParts = current.split('.').map(int.parse).toList();
      final List<int> minParts = min.split('.').map(int.parse).toList();
      for (int i = 0; i < minParts.length; i++) {
        final curVal = i < curParts.length ? curParts[i] : 0;
        final minVal = minParts[i];
        if (curVal < minVal) return true;
        if (curVal > minVal) return false;
      }
    } catch (e) {
      // fallback if version parsing fails
    }
    return false;
  }
}

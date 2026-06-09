import '../core/app_constants.dart';

class RemoteConfig {
  final String minVersion;
  final bool isMaintenanceActive;
  final String maintenanceMessage;
  final String storeUpdateUrl;
  final String githubUpdateUrl;
  final bool allowBypass;

  RemoteConfig({
    required this.minVersion,
    required this.isMaintenanceActive,
    required this.maintenanceMessage,
    required this.storeUpdateUrl,
    required this.githubUpdateUrl,
    required this.allowBypass,
  });

  factory RemoteConfig.fromJson(Map<String, dynamic> json) {
    return RemoteConfig(
      minVersion: json['min_version'] as String? ?? '1.0.0',
      isMaintenanceActive: json['maintenance']?['active'] as bool? ?? false,
      maintenanceMessage: json['maintenance']?['message'] as String? ?? '',
      storeUpdateUrl:
          json['store_update_url'] as String? ?? AppConstants.storeUpdateUrl,
      githubUpdateUrl:
          json['github_update_url'] as String? ?? AppConstants.githubApiUrl,
      allowBypass: json['allow_bypass'] as bool? ?? false,
    );
  }
}

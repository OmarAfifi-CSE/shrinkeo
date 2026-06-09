class AppConstants {
  /// The GitHub API URL for checking the latest release.
  static const String githubApiUrl =
      'https://api.github.com/repos/OmarAfifi-CSE/shrinkeo/releases';

  /// The fallback website URL to download from if auto-update fails.
  static const String websiteUrl = 'https://omar-afifi.com/shrinkeo/';

  /// The URL for the Support Project / Donation link.
  static const String supportUrl = 'https://ko-fi.com/omarafifi';

  /// The raw GitHub URL for remote configuration checks (Mandatory Updates).
  static const String remoteConfigUrl = 'https://raw.githubusercontent.com/OmarAfifi-CSE/shrinkeo/main/remote_config.json';

  /// The Microsoft Store link for the app.
  static const String storeUpdateUrl = 'ms-windows-store://pdp/?productid=XP8JW74PJ5WXPV';
}

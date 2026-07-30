import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Helper utility for supported application languages, native names, flags, and typography.
class LanguageHelper {
  /// Top 44 most spoken & popular languages worldwide.
  static const List<String> supportedCodes = [
    'en',
    'ar',
    'es',
    'fr',
    'de',
    'it',
    'pt',
    'ru',
    'tr',
    'zh',
    'ja',
    'ko',
    'hi',
    'vi',
    'id',
    'pl',
    'nl',
    'th',
    'sv',
    'uk',
    'ro',
    'el',
    'cs',
    'hu',
    'fa',
    'bn',
    'ur',
    'fil',
    'ta',
    'sw',
    'ms',
    'da',
    'nb',
    'fi',
    'mr',
    'te',
    'gu',
    'kn',
    'ml',
    'ca',
    'sk',
    'bg',
    'sr',
    'hr',
  ];

  static List<Locale> get supportedLocales =>
      supportedCodes.map((code) => Locale(code)).toList();

  static bool isRtl(String code) {
    return ['ar', 'fa', 'ur', 'he'].contains(code.toLowerCase());
  }

  /// Asynchronously pre-warms all 44 country flag SI vector assets in memory
  /// upon app startup so opening LanguagePanel is 100% smooth without asset loading hitches.
  static Future<void> prewarmCountryFlags() async {
    for (final code in supportedCodes) {
      final countryCode = getCountryCode(code).toLowerCase();
      try {
        await rootBundle.load('packages/country_flags/res/si/$countryCode.si');
      } catch (_) {
        // Ignore fallback
      }
    }
  }

  static String getNativeName(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Español';
      case 'de':
        return 'Deutsch';
      case 'it':
        return 'Italiano';
      case 'pt':
        return 'Português';
      case 'ru':
        return 'Русский';
      case 'tr':
        return 'Türkçe';
      case 'zh':
        return '中文';
      case 'ja':
        return '日本語';
      case 'ko':
        return '한국어';
      case 'hi':
        return 'हिन्दी';
      case 'vi':
        return 'Tiếng Việt';
      case 'id':
        return 'Bahasa Indonesia';
      case 'pl':
        return 'Polski';
      case 'nl':
        return 'Nederlands';
      case 'th':
        return 'ภาษาไทย';
      case 'sv':
        return 'Svenska';
      case 'uk':
        return 'Українська';
      case 'ro':
        return 'Română';
      case 'el':
        return 'Ελληνικά';
      case 'cs':
        return 'Čeština';
      case 'hu':
        return 'Magyar';
      case 'fa':
        return 'فارسی';
      case 'bn':
        return 'বাংলা';
      case 'ur':
        return 'اردو';
      case 'fil':
        return 'Filipino';
      case 'ta':
        return 'தமிழ்';
      case 'sw':
        return 'Kiswahili';
      case 'ms':
        return 'Bahasa Melayu';
      case 'da':
        return 'Dansk';
      case 'nb':
        return 'Norsk Bokmål';
      case 'fi':
        return 'Suomi';
      case 'mr':
        return 'मराठी';
      case 'te':
        return 'తెలుగు';
      case 'gu':
        return 'ગુજરાતી';
      case 'kn':
        return 'கன்னட (Kannada)';
      case 'ml':
        return 'മലയാളം';
      case 'ca':
        return 'Català';
      case 'sk':
        return 'Slovenčina';
      case 'bg':
        return 'Български';
      case 'sr':
        return 'Српски';
      case 'hr':
        return 'Hrvatski';
      default:
        return code.toUpperCase();
    }
  }

  static String getEnglishName(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        return 'English';
      case 'ar':
        return 'Arabic';
      case 'fr':
        return 'French';
      case 'es':
        return 'Spanish';
      case 'de':
        return 'German';
      case 'it':
        return 'Italian';
      case 'pt':
        return 'Portuguese';
      case 'ru':
        return 'Russian';
      case 'tr':
        return 'Turkish';
      case 'zh':
        return 'Chinese';
      case 'ja':
        return 'Japanese';
      case 'ko':
        return 'Korean';
      case 'hi':
        return 'Hindi';
      case 'vi':
        return 'Vietnamese';
      case 'id':
        return 'Indonesian';
      case 'pl':
        return 'Polish';
      case 'nl':
        return 'Dutch';
      case 'th':
        return 'Thai';
      case 'sv':
        return 'Swedish';
      case 'uk':
        return 'Ukrainian';
      case 'ro':
        return 'Romanian';
      case 'el':
        return 'Greek';
      case 'cs':
        return 'Czech';
      case 'hu':
        return 'Hungarian';
      case 'fa':
        return 'Persian';
      case 'bn':
        return 'Bengali';
      case 'ur':
        return 'Urdu';
      case 'fil':
        return 'Filipino';
      case 'ta':
        return 'Tamil';
      case 'sw':
        return 'Swahili';
      case 'ms':
        return 'Malay';
      case 'da':
        return 'Danish';
      case 'nb':
        return 'Norwegian';
      case 'fi':
        return 'Finnish';
      case 'mr':
        return 'Marathi';
      case 'te':
        return 'Telugu';
      case 'gu':
        return 'Gujarati';
      case 'kn':
        return 'Kannada';
      case 'ml':
        return 'Malayalam';
      case 'ca':
        return 'Catalan';
      case 'sk':
        return 'Slovak';
      case 'bg':
        return 'Bulgarian';
      case 'sr':
        return 'Serbian';
      case 'hr':
        return 'Croatian';
      default:
        return code;
    }
  }

  static String getCountryCode(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        return 'US';
      case 'ar':
        return 'EG';
      case 'fr':
        return 'FR';
      case 'es':
        return 'ES';
      case 'de':
        return 'DE';
      case 'it':
        return 'IT';
      case 'pt':
        return 'BR';
      case 'ru':
        return 'RU';
      case 'tr':
        return 'TR';
      case 'zh':
        return 'CN';
      case 'ja':
        return 'JP';
      case 'ko':
        return 'KR';
      case 'hi':
        return 'IN';
      case 'vi':
        return 'VN';
      case 'id':
        return 'ID';
      case 'pl':
        return 'PL';
      case 'nl':
        return 'NL';
      case 'th':
        return 'TH';
      case 'sv':
        return 'SE';
      case 'uk':
        return 'UA';
      case 'ro':
        return 'RO';
      case 'el':
        return 'GR';
      case 'cs':
        return 'CZ';
      case 'hu':
        return 'HU';
      case 'fa':
        return 'IR';
      case 'bn':
        return 'BD';
      case 'ur':
        return 'PK';
      case 'fil':
        return 'PH';
      case 'ta':
        return 'IN';
      case 'sw':
        return 'KE';
      case 'ms':
        return 'MY';
      case 'da':
        return 'DK';
      case 'nb':
        return 'NO';
      case 'fi':
        return 'FI';
      case 'mr':
        return 'IN';
      case 'te':
        return 'IN';
      case 'gu':
        return 'IN';
      case 'kn':
        return 'IN';
      case 'ml':
        return 'IN';
      case 'ca':
        return 'ES';
      case 'sk':
        return 'SK';
      case 'bg':
        return 'BG';
      case 'sr':
        return 'RS';
      case 'hr':
        return 'HR';
      default:
        return code.toUpperCase();
    }
  }

  static String? getFontFamily(String code) {
    if (code == 'ar' || code == 'fa' || code == 'ur') return 'Cairo';
    return 'Outfit';
  }
}

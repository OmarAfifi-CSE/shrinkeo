import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('gu'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('mr'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Shrinkeo'**
  String get appName;

  /// No description provided for @totalSpaceSaved.
  ///
  /// In en, this message translates to:
  /// **'Total Space Saved Globally'**
  String get totalSpaceSaved;

  /// No description provided for @savedSpacePrefix.
  ///
  /// In en, this message translates to:
  /// **'Saved:'**
  String get savedSpacePrefix;

  /// No description provided for @supportButtonText.
  ///
  /// In en, this message translates to:
  /// **'Support Project'**
  String get supportButtonText;

  /// No description provided for @lightThemeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lightThemeTooltip;

  /// No description provided for @darkThemeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkThemeTooltip;

  /// No description provided for @settingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTooltip;

  /// No description provided for @minimizeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Minimize'**
  String get minimizeTooltip;

  /// No description provided for @closeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeTooltip;

  /// No description provided for @restoreTooltip.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restoreTooltip;

  /// No description provided for @maximizeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Maximize'**
  String get maximizeTooltip;

  /// No description provided for @tabCompressionQuality.
  ///
  /// In en, this message translates to:
  /// **'Compression & Quality'**
  String get tabCompressionQuality;

  /// No description provided for @tabVideoEditingTools.
  ///
  /// In en, this message translates to:
  /// **'Video Editing & Tools'**
  String get tabVideoEditingTools;

  /// No description provided for @tabAudioSettings.
  ///
  /// In en, this message translates to:
  /// **'Audio Settings'**
  String get tabAudioSettings;

  /// No description provided for @tabEngineOutput.
  ///
  /// In en, this message translates to:
  /// **'Engine & Output'**
  String get tabEngineOutput;

  /// No description provided for @compressionSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Compression Settings'**
  String get compressionSettingsTitle;

  /// No description provided for @resetToDefaults.
  ///
  /// In en, this message translates to:
  /// **'Reset to Defaults'**
  String get resetToDefaults;

  /// No description provided for @resetDefaultTooltip.
  ///
  /// In en, this message translates to:
  /// **'Reset to default'**
  String get resetDefaultTooltip;

  /// No description provided for @modeTargetSizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Compression Target Mode'**
  String get modeTargetSizeTitle;

  /// No description provided for @modeCrfLabel.
  ///
  /// In en, this message translates to:
  /// **'Quality (CRF)'**
  String get modeCrfLabel;

  /// No description provided for @modeTargetSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Target Size (MB)'**
  String get modeTargetSizeLabel;

  /// No description provided for @crfQualityTitle.
  ///
  /// In en, this message translates to:
  /// **'CRF Quality (Constant Rate Factor)'**
  String get crfQualityTitle;

  /// No description provided for @targetSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Target File Size (MB)'**
  String get targetSizeLabel;

  /// No description provided for @targetSizeDesc.
  ///
  /// In en, this message translates to:
  /// **'Calculates bitrate to fit within size limit (Min: 1 MB). Extremely low limits on long videos will lower visual resolution.'**
  String get targetSizeDesc;

  /// No description provided for @encodingSpeedTitle.
  ///
  /// In en, this message translates to:
  /// **'Encoding Speed'**
  String get encodingSpeedTitle;

  /// No description provided for @presetUltrafastLabel.
  ///
  /// In en, this message translates to:
  /// **'Ultrafast'**
  String get presetUltrafastLabel;

  /// No description provided for @presetUltrafastDesc.
  ///
  /// In en, this message translates to:
  /// **'Max speed, but achieves the least file size reduction.'**
  String get presetUltrafastDesc;

  /// No description provided for @presetSuperfastLabel.
  ///
  /// In en, this message translates to:
  /// **'Superfast'**
  String get presetSuperfastLabel;

  /// No description provided for @presetSuperfastDesc.
  ///
  /// In en, this message translates to:
  /// **'Very quick encoding with lower compression efficiency.'**
  String get presetSuperfastDesc;

  /// No description provided for @presetVeryfastLabel.
  ///
  /// In en, this message translates to:
  /// **'Very Fast'**
  String get presetVeryfastLabel;

  /// No description provided for @presetVeryfastDesc.
  ///
  /// In en, this message translates to:
  /// **'Faster than average, providing moderate size reduction.'**
  String get presetVeryfastDesc;

  /// No description provided for @presetFasterLabel.
  ///
  /// In en, this message translates to:
  /// **'Faster'**
  String get presetFasterLabel;

  /// No description provided for @presetFasterDesc.
  ///
  /// In en, this message translates to:
  /// **'A slight speed boost with good overall compression.'**
  String get presetFasterDesc;

  /// No description provided for @presetFastLabel.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get presetFastLabel;

  /// No description provided for @presetFastDesc.
  ///
  /// In en, this message translates to:
  /// **'Great balance of speed and size reduction. Recommended.'**
  String get presetFastDesc;

  /// No description provided for @presetMediumLabel.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get presetMediumLabel;

  /// No description provided for @presetMediumDesc.
  ///
  /// In en, this message translates to:
  /// **'Default balance of encoding speed and compression.'**
  String get presetMediumDesc;

  /// No description provided for @presetSlowLabel.
  ///
  /// In en, this message translates to:
  /// **'Slow'**
  String get presetSlowLabel;

  /// No description provided for @presetSlowDesc.
  ///
  /// In en, this message translates to:
  /// **'Slower process, but yields significantly smaller files.'**
  String get presetSlowDesc;

  /// No description provided for @presetVeryslowLabel.
  ///
  /// In en, this message translates to:
  /// **'Very Slow'**
  String get presetVeryslowLabel;

  /// No description provided for @presetVeryslowDesc.
  ///
  /// In en, this message translates to:
  /// **'Takes longest, but guarantees maximum file size reduction.'**
  String get presetVeryslowDesc;

  /// No description provided for @videoCodecTitle.
  ///
  /// In en, this message translates to:
  /// **'Video Codec'**
  String get videoCodecTitle;

  /// No description provided for @codecH264Label.
  ///
  /// In en, this message translates to:
  /// **'H.264'**
  String get codecH264Label;

  /// No description provided for @codecH264Desc.
  ///
  /// In en, this message translates to:
  /// **'Maximum compatibility with older devices & browsers.'**
  String get codecH264Desc;

  /// No description provided for @codecH265Label.
  ///
  /// In en, this message translates to:
  /// **'H.265 / HEVC'**
  String get codecH265Label;

  /// No description provided for @codecH265Desc.
  ///
  /// In en, this message translates to:
  /// **'Better compression efficiency (smaller files).'**
  String get codecH265Desc;

  /// No description provided for @codecAv1Label.
  ///
  /// In en, this message translates to:
  /// **'AV1'**
  String get codecAv1Label;

  /// No description provided for @codecAv1Desc.
  ///
  /// In en, this message translates to:
  /// **'Next-gen codec: Maximum compression efficiency (30% smaller than H.265).'**
  String get codecAv1Desc;

  /// No description provided for @hardwareEncoderTitle.
  ///
  /// In en, this message translates to:
  /// **'Hardware Encoder (GPU)'**
  String get hardwareEncoderTitle;

  /// No description provided for @hwSoftwareLabel.
  ///
  /// In en, this message translates to:
  /// **'Software (CPU)'**
  String get hwSoftwareLabel;

  /// No description provided for @hwSoftwareDesc.
  ///
  /// In en, this message translates to:
  /// **'Slowest, but maximum compatibility & smallest files.'**
  String get hwSoftwareDesc;

  /// No description provided for @hwNvidiaLabel.
  ///
  /// In en, this message translates to:
  /// **'Nvidia (NVENC)'**
  String get hwNvidiaLabel;

  /// No description provided for @hwNvidiaDesc.
  ///
  /// In en, this message translates to:
  /// **'Extremely fast encoding for Nvidia GPUs (slightly larger files).'**
  String get hwNvidiaDesc;

  /// No description provided for @hwAmdLabel.
  ///
  /// In en, this message translates to:
  /// **'AMD (AMF)'**
  String get hwAmdLabel;

  /// No description provided for @hwAmdDesc.
  ///
  /// In en, this message translates to:
  /// **'Extremely fast encoding for AMD GPUs (slightly larger files).'**
  String get hwAmdDesc;

  /// No description provided for @hwIntelLabel.
  ///
  /// In en, this message translates to:
  /// **'Intel (QSV)'**
  String get hwIntelLabel;

  /// No description provided for @hwIntelDesc.
  ///
  /// In en, this message translates to:
  /// **'Extremely fast encoding for Intel GPUs (slightly larger files).'**
  String get hwIntelDesc;

  /// No description provided for @resolutionTitle.
  ///
  /// In en, this message translates to:
  /// **'Max Resolution'**
  String get resolutionTitle;

  /// No description provided for @resOriginalLabel.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get resOriginalLabel;

  /// No description provided for @resOriginalDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep the original video resolution.'**
  String get resOriginalDesc;

  /// No description provided for @res4kLabel.
  ///
  /// In en, this message translates to:
  /// **'4K'**
  String get res4kLabel;

  /// No description provided for @res4kDesc.
  ///
  /// In en, this message translates to:
  /// **'Scale down to 4K max (Extremely high quality).'**
  String get res4kDesc;

  /// No description provided for @res2kLabel.
  ///
  /// In en, this message translates to:
  /// **'2K'**
  String get res2kLabel;

  /// No description provided for @res2kDesc.
  ///
  /// In en, this message translates to:
  /// **'Scale down to 2K max (High quality).'**
  String get res2kDesc;

  /// No description provided for @res1080pLabel.
  ///
  /// In en, this message translates to:
  /// **'1080p'**
  String get res1080pLabel;

  /// No description provided for @res1080pDesc.
  ///
  /// In en, this message translates to:
  /// **'Scale down to 1080p max (Standard HD quality).'**
  String get res1080pDesc;

  /// No description provided for @res720pLabel.
  ///
  /// In en, this message translates to:
  /// **'720p'**
  String get res720pLabel;

  /// No description provided for @res720pDesc.
  ///
  /// In en, this message translates to:
  /// **'Scale down to 720p max (Good for mobile viewing).'**
  String get res720pDesc;

  /// No description provided for @res480pLabel.
  ///
  /// In en, this message translates to:
  /// **'480p'**
  String get res480pLabel;

  /// No description provided for @res480pDesc.
  ///
  /// In en, this message translates to:
  /// **'Scale down to 480p max (DVD quality, very small size).'**
  String get res480pDesc;

  /// No description provided for @res360pLabel.
  ///
  /// In en, this message translates to:
  /// **'360p'**
  String get res360pLabel;

  /// No description provided for @res360pDesc.
  ///
  /// In en, this message translates to:
  /// **'Scale down to 360p max (Extreme compression, low quality).'**
  String get res360pDesc;

  /// No description provided for @frameRateTitle.
  ///
  /// In en, this message translates to:
  /// **'Frame Rate (FPS)'**
  String get frameRateTitle;

  /// No description provided for @fpsOriginalLabel.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get fpsOriginalLabel;

  /// No description provided for @fpsOriginalDesc.
  ///
  /// In en, this message translates to:
  /// **'Keeps the exact same framerate as the source video.'**
  String get fpsOriginalDesc;

  /// No description provided for @fps60Label.
  ///
  /// In en, this message translates to:
  /// **'60 fps'**
  String get fps60Label;

  /// No description provided for @fps60Desc.
  ///
  /// In en, this message translates to:
  /// **'Ultra smooth, ideal for gaming or sports (creates larger files).'**
  String get fps60Desc;

  /// No description provided for @fps30Label.
  ///
  /// In en, this message translates to:
  /// **'30 fps'**
  String get fps30Label;

  /// No description provided for @fps30Desc.
  ///
  /// In en, this message translates to:
  /// **'Standard smoothness, great balance for most videos.'**
  String get fps30Desc;

  /// No description provided for @fps24Label.
  ///
  /// In en, this message translates to:
  /// **'24 fps'**
  String get fps24Label;

  /// No description provided for @fps24Desc.
  ///
  /// In en, this message translates to:
  /// **'Cinematic look, useful for movies and saving space.'**
  String get fps24Desc;

  /// No description provided for @enableVideoDenoiseTitle.
  ///
  /// In en, this message translates to:
  /// **'Clean Video Noise & Grain'**
  String get enableVideoDenoiseTitle;

  /// No description provided for @enableVideoDenoiseDesc.
  ///
  /// In en, this message translates to:
  /// **'Applies 3D spatial-temporal filtering to remove low-light digital grain and boost compression by 15-25%.'**
  String get enableVideoDenoiseDesc;

  /// No description provided for @exportFormatTitle.
  ///
  /// In en, this message translates to:
  /// **'Export Format'**
  String get exportFormatTitle;

  /// No description provided for @exportVideoLabel.
  ///
  /// In en, this message translates to:
  /// **'Standard Video'**
  String get exportVideoLabel;

  /// No description provided for @exportVideoDesc.
  ///
  /// In en, this message translates to:
  /// **'Export to MP4/MKV/MOV container'**
  String get exportVideoDesc;

  /// No description provided for @exportGifLabel.
  ///
  /// In en, this message translates to:
  /// **'Animated GIF'**
  String get exportGifLabel;

  /// No description provided for @exportGifDesc.
  ///
  /// In en, this message translates to:
  /// **'Export high-quality animated GIF clip'**
  String get exportGifDesc;

  /// No description provided for @exportMp3Label.
  ///
  /// In en, this message translates to:
  /// **'Extract MP3'**
  String get exportMp3Label;

  /// No description provided for @exportMp3Desc.
  ///
  /// In en, this message translates to:
  /// **'Extract audio track as 320kbps MP3'**
  String get exportMp3Desc;

  /// No description provided for @exportAacLabel.
  ///
  /// In en, this message translates to:
  /// **'Extract AAC'**
  String get exportAacLabel;

  /// No description provided for @exportAacDesc.
  ///
  /// In en, this message translates to:
  /// **'Extract audio track as high-quality AAC'**
  String get exportAacDesc;

  /// No description provided for @exportWavLabel.
  ///
  /// In en, this message translates to:
  /// **'Extract WAV'**
  String get exportWavLabel;

  /// No description provided for @exportWavDesc.
  ///
  /// In en, this message translates to:
  /// **'Extract uncompressed studio WAV audio'**
  String get exportWavDesc;

  /// No description provided for @privacyScrubbingTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy & GPS Scrubbing'**
  String get privacyScrubbingTitle;

  /// No description provided for @keepMetadataLabel.
  ///
  /// In en, this message translates to:
  /// **'Keep Metadata'**
  String get keepMetadataLabel;

  /// No description provided for @stripGpsExifLabel.
  ///
  /// In en, this message translates to:
  /// **'Strip GPS/EXIF'**
  String get stripGpsExifLabel;

  /// No description provided for @stripGpsExifInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Strip GPS & Metadata'**
  String get stripGpsExifInfoTitle;

  /// No description provided for @stripGpsExifInfoDesc.
  ///
  /// In en, this message translates to:
  /// **'Removes camera info, GPS location, & timestamps.'**
  String get stripGpsExifInfoDesc;

  /// No description provided for @keepMetadataInfoDesc.
  ///
  /// In en, this message translates to:
  /// **'Preserves original video EXIF metadata.'**
  String get keepMetadataInfoDesc;

  /// No description provided for @autoCropBlackBarsTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-Crop Black Bars'**
  String get autoCropBlackBarsTitle;

  /// No description provided for @autoCropLabel.
  ///
  /// In en, this message translates to:
  /// **'Auto-Crop'**
  String get autoCropLabel;

  /// No description provided for @autoCropActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-Crop Active'**
  String get autoCropActiveTitle;

  /// No description provided for @autoCropActiveDesc.
  ///
  /// In en, this message translates to:
  /// **'Removes black letterbox borders from video.'**
  String get autoCropActiveDesc;

  /// No description provided for @autoCropDisabledDesc.
  ///
  /// In en, this message translates to:
  /// **'Keeps original video frame borders.'**
  String get autoCropDisabledDesc;

  /// No description provided for @playbackSpeedTitle.
  ///
  /// In en, this message translates to:
  /// **'Playback Speed'**
  String get playbackSpeedTitle;

  /// No description provided for @speedOriginalLabel.
  ///
  /// In en, this message translates to:
  /// **'1.0x'**
  String get speedOriginalLabel;

  /// No description provided for @speedOriginalDesc.
  ///
  /// In en, this message translates to:
  /// **'Normal video speed'**
  String get speedOriginalDesc;

  /// No description provided for @speedSlow05Label.
  ///
  /// In en, this message translates to:
  /// **'0.5x Slow-mo'**
  String get speedSlow05Label;

  /// No description provided for @speedSlow05Desc.
  ///
  /// In en, this message translates to:
  /// **'Half speed playback'**
  String get speedSlow05Desc;

  /// No description provided for @speedFast15Label.
  ///
  /// In en, this message translates to:
  /// **'1.5x Speed'**
  String get speedFast15Label;

  /// No description provided for @speedFast15Desc.
  ///
  /// In en, this message translates to:
  /// **'Slight speed up'**
  String get speedFast15Desc;

  /// No description provided for @speedFast20Label.
  ///
  /// In en, this message translates to:
  /// **'2.0x Fast'**
  String get speedFast20Label;

  /// No description provided for @speedFast20Desc.
  ///
  /// In en, this message translates to:
  /// **'Double speed playback'**
  String get speedFast20Desc;

  /// No description provided for @speedTimelapse40Label.
  ///
  /// In en, this message translates to:
  /// **'4.0x Timelapse'**
  String get speedTimelapse40Label;

  /// No description provided for @speedTimelapse40Desc.
  ///
  /// In en, this message translates to:
  /// **'Ultra fast timelapse'**
  String get speedTimelapse40Desc;

  /// No description provided for @canvasAspectRatioTitle.
  ///
  /// In en, this message translates to:
  /// **'Canvas Aspect Ratio'**
  String get canvasAspectRatioTitle;

  /// No description provided for @aspectOriginalLabel.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get aspectOriginalLabel;

  /// No description provided for @aspectOriginalDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep original video dimensions'**
  String get aspectOriginalDesc;

  /// No description provided for @aspectShortsLabel.
  ///
  /// In en, this message translates to:
  /// **'9:16 Shorts'**
  String get aspectShortsLabel;

  /// No description provided for @aspectShortsDesc.
  ///
  /// In en, this message translates to:
  /// **'Padded canvas for TikTok & Reels'**
  String get aspectShortsDesc;

  /// No description provided for @aspectSquareLabel.
  ///
  /// In en, this message translates to:
  /// **'1:1 Square'**
  String get aspectSquareLabel;

  /// No description provided for @aspectSquareDesc.
  ///
  /// In en, this message translates to:
  /// **'Padded canvas for Instagram feed posts'**
  String get aspectSquareDesc;

  /// No description provided for @aspectPortraitLabel.
  ///
  /// In en, this message translates to:
  /// **'4:5 Portrait'**
  String get aspectPortraitLabel;

  /// No description provided for @aspectPortraitDesc.
  ///
  /// In en, this message translates to:
  /// **'Padded canvas for Instagram vertical posts'**
  String get aspectPortraitDesc;

  /// No description provided for @aspectWidescreenLabel.
  ///
  /// In en, this message translates to:
  /// **'16:9 Wide'**
  String get aspectWidescreenLabel;

  /// No description provided for @aspectWidescreenDesc.
  ///
  /// In en, this message translates to:
  /// **'Padded canvas for YouTube & TV screens'**
  String get aspectWidescreenDesc;

  /// No description provided for @aspectClassicLabel.
  ///
  /// In en, this message translates to:
  /// **'4:3 Classic'**
  String get aspectClassicLabel;

  /// No description provided for @aspectClassicDesc.
  ///
  /// In en, this message translates to:
  /// **'Padded canvas for classic TV screens'**
  String get aspectClassicDesc;

  /// No description provided for @aspectCinemaLabel.
  ///
  /// In en, this message translates to:
  /// **'21:9 Cinema'**
  String get aspectCinemaLabel;

  /// No description provided for @aspectCinemaDesc.
  ///
  /// In en, this message translates to:
  /// **'Padded canvas for Ultrawide cinema monitors'**
  String get aspectCinemaDesc;

  /// No description provided for @aspectCustomLabel.
  ///
  /// In en, this message translates to:
  /// **'Custom Ratio'**
  String get aspectCustomLabel;

  /// No description provided for @aspectCustomDesc.
  ///
  /// In en, this message translates to:
  /// **'Padded canvas for custom aspect ratio'**
  String get aspectCustomDesc;

  /// No description provided for @customRatioTooltip.
  ///
  /// In en, this message translates to:
  /// **'Type custom ratio e.g. 16:10, 2:1, 18:9'**
  String get customRatioTooltip;

  /// No description provided for @rotationFlipTitle.
  ///
  /// In en, this message translates to:
  /// **'Rotation & Flip'**
  String get rotationFlipTitle;

  /// No description provided for @rotOriginalLabel.
  ///
  /// In en, this message translates to:
  /// **'Original (0°)'**
  String get rotOriginalLabel;

  /// No description provided for @rotOriginalDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep original orientation'**
  String get rotOriginalDesc;

  /// No description provided for @rot90Label.
  ///
  /// In en, this message translates to:
  /// **'90° CW'**
  String get rot90Label;

  /// No description provided for @rot90Desc.
  ///
  /// In en, this message translates to:
  /// **'Rotate 90 degrees right'**
  String get rot90Desc;

  /// No description provided for @rot180Label.
  ///
  /// In en, this message translates to:
  /// **'180° Flip'**
  String get rot180Label;

  /// No description provided for @rot180Desc.
  ///
  /// In en, this message translates to:
  /// **'Rotate upside down'**
  String get rot180Desc;

  /// No description provided for @rot270Label.
  ///
  /// In en, this message translates to:
  /// **'270° CW'**
  String get rot270Label;

  /// No description provided for @rot270Desc.
  ///
  /// In en, this message translates to:
  /// **'Rotate 90 degrees left'**
  String get rot270Desc;

  /// No description provided for @rotFlipHLabel.
  ///
  /// In en, this message translates to:
  /// **'Flip H'**
  String get rotFlipHLabel;

  /// No description provided for @rotFlipHDesc.
  ///
  /// In en, this message translates to:
  /// **'Mirror image horizontally'**
  String get rotFlipHDesc;

  /// No description provided for @rotFlipVLabel.
  ///
  /// In en, this message translates to:
  /// **'Flip V'**
  String get rotFlipVLabel;

  /// No description provided for @rotFlipVDesc.
  ///
  /// In en, this message translates to:
  /// **'Mirror image vertically'**
  String get rotFlipVDesc;

  /// No description provided for @rotCustomLabel.
  ///
  /// In en, this message translates to:
  /// **'Custom Angle'**
  String get rotCustomLabel;

  /// No description provided for @rotCustomDesc.
  ///
  /// In en, this message translates to:
  /// **'Rotate by custom degree angle'**
  String get rotCustomDesc;

  /// No description provided for @customRotationTooltip.
  ///
  /// In en, this message translates to:
  /// **'Type degree angle e.g. 45, 30, 120'**
  String get customRotationTooltip;

  /// No description provided for @trimVideoTitle.
  ///
  /// In en, this message translates to:
  /// **'Trim Video'**
  String get trimVideoTitle;

  /// No description provided for @fullVideoLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Video'**
  String get fullVideoLabel;

  /// No description provided for @cutClipLabel.
  ///
  /// In en, this message translates to:
  /// **'Cut Clip'**
  String get cutClipLabel;

  /// No description provided for @trimStartLabel.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get trimStartLabel;

  /// No description provided for @trimEndLabel.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get trimEndLabel;

  /// No description provided for @trimActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Trim Active'**
  String get trimActiveTitle;

  /// No description provided for @fullVideoDesc.
  ///
  /// In en, this message translates to:
  /// **'Processes the entire video duration without trimming.'**
  String get fullVideoDesc;

  /// No description provided for @audioModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Audio Track Mode'**
  String get audioModeTitle;

  /// No description provided for @audioOriginalLabel.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get audioOriginalLabel;

  /// No description provided for @audioOriginalDesc.
  ///
  /// In en, this message translates to:
  /// **'Preserves original audio track (No quality loss).'**
  String get audioOriginalDesc;

  /// No description provided for @audioAac256Label.
  ///
  /// In en, this message translates to:
  /// **'High Quality'**
  String get audioAac256Label;

  /// No description provided for @audioAac256Desc.
  ///
  /// In en, this message translates to:
  /// **'Compresses to AAC 256kbps (Excellent quality, moderate size).'**
  String get audioAac256Desc;

  /// No description provided for @audioAac128Label.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get audioAac128Label;

  /// No description provided for @audioAac128Desc.
  ///
  /// In en, this message translates to:
  /// **'Compresses to AAC 128kbps (Good quality, small size - Web Standard).'**
  String get audioAac128Desc;

  /// No description provided for @audioAac64Label.
  ///
  /// In en, this message translates to:
  /// **'Low Quality'**
  String get audioAac64Label;

  /// No description provided for @audioAac64Desc.
  ///
  /// In en, this message translates to:
  /// **'Compresses to AAC 64kbps (Best for speech/podcasts, tiny size).'**
  String get audioAac64Desc;

  /// No description provided for @audioMuteLabel.
  ///
  /// In en, this message translates to:
  /// **'Mute Audio'**
  String get audioMuteLabel;

  /// No description provided for @audioMuteDesc.
  ///
  /// In en, this message translates to:
  /// **'Removes the audio track completely to save space.'**
  String get audioMuteDesc;

  /// No description provided for @audioNormTitle.
  ///
  /// In en, this message translates to:
  /// **'Audio Volume Normalization'**
  String get audioNormTitle;

  /// No description provided for @audioNormOffLabel.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get audioNormOffLabel;

  /// No description provided for @audioNormOffDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep original dynamic volume.'**
  String get audioNormOffDesc;

  /// No description provided for @audioNormSpeechLabel.
  ///
  /// In en, this message translates to:
  /// **'Speech'**
  String get audioNormSpeechLabel;

  /// No description provided for @audioNormSpeechDesc.
  ///
  /// In en, this message translates to:
  /// **'EBU R128 (-16 LUFS) broadcast loudness for clear dialogue.'**
  String get audioNormSpeechDesc;

  /// No description provided for @audioNormDynamicLabel.
  ///
  /// In en, this message translates to:
  /// **'Movie Dynamic'**
  String get audioNormDynamicLabel;

  /// No description provided for @audioNormDynamicDesc.
  ///
  /// In en, this message translates to:
  /// **'Dynaudnorm smooths quiet & loud scenes smoothly.'**
  String get audioNormDynamicDesc;

  /// No description provided for @audioNormBoostLabel.
  ///
  /// In en, this message translates to:
  /// **'Soft Boost'**
  String get audioNormBoostLabel;

  /// No description provided for @audioNormBoostDesc.
  ///
  /// In en, this message translates to:
  /// **'Fixed +3dB volume gain boost for low-audio videos.'**
  String get audioNormBoostDesc;

  /// No description provided for @audioChanTitle.
  ///
  /// In en, this message translates to:
  /// **'Audio Channels Downmix'**
  String get audioChanTitle;

  /// No description provided for @audioChanOriginalLabel.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get audioChanOriginalLabel;

  /// No description provided for @audioChanOriginalDesc.
  ///
  /// In en, this message translates to:
  /// **'Preserve exact source audio channels (Mono, Stereo, 5.1, etc.).'**
  String get audioChanOriginalDesc;

  /// No description provided for @audioChanStereoLabel.
  ///
  /// In en, this message translates to:
  /// **'Stereo (2.0)'**
  String get audioChanStereoLabel;

  /// No description provided for @audioChanStereoDesc.
  ///
  /// In en, this message translates to:
  /// **'Standard 2-channel compatibility for all screens.'**
  String get audioChanStereoDesc;

  /// No description provided for @audioChanMonoLabel.
  ///
  /// In en, this message translates to:
  /// **'Mono (1.0)'**
  String get audioChanMonoLabel;

  /// No description provided for @audioChanMonoDesc.
  ///
  /// In en, this message translates to:
  /// **'Single channel downmix - 50% extra audio size savings.'**
  String get audioChanMonoDesc;

  /// No description provided for @removeNoiseLabel.
  ///
  /// In en, this message translates to:
  /// **'Remove Noise'**
  String get removeNoiseLabel;

  /// No description provided for @enableAudioDenoiseTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove Mic & Fan Noise'**
  String get enableAudioDenoiseTitle;

  /// No description provided for @enableAudioDenoiseDesc.
  ///
  /// In en, this message translates to:
  /// **'Applies FFT spectral filtering to eliminate background mic hiss, fan noise, and room hum.'**
  String get enableAudioDenoiseDesc;

  /// No description provided for @outputDirectoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Output Directory'**
  String get outputDirectoryTitle;

  /// No description provided for @defaultOutputDirectory.
  ///
  /// In en, this message translates to:
  /// **'Default (Next to original file)'**
  String get defaultOutputDirectory;

  /// No description provided for @selectOutputFolderTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Output Folder'**
  String get selectOutputFolderTitle;

  /// No description provided for @clearOutputFolder.
  ///
  /// In en, this message translates to:
  /// **'Clear custom folder (Use default)'**
  String get clearOutputFolder;

  /// No description provided for @changeBtn.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changeBtn;

  /// No description provided for @outputLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Output Location Behavior'**
  String get outputLocationTitle;

  /// No description provided for @outputLocationUnifiedLabel.
  ///
  /// In en, this message translates to:
  /// **'Unified Folder'**
  String get outputLocationUnifiedLabel;

  /// No description provided for @outputLocationUnifiedDesc.
  ///
  /// In en, this message translates to:
  /// **'All compressed videos are saved into a single folder.'**
  String get outputLocationUnifiedDesc;

  /// No description provided for @outputLocationSameLabel.
  ///
  /// In en, this message translates to:
  /// **'Same as Original'**
  String get outputLocationSameLabel;

  /// No description provided for @outputLocationSameDesc.
  ///
  /// In en, this message translates to:
  /// **'Each video is saved in a subfolder next to its original location.'**
  String get outputLocationSameDesc;

  /// No description provided for @fileManagementTitle.
  ///
  /// In en, this message translates to:
  /// **'File Management'**
  String get fileManagementTitle;

  /// No description provided for @keepOriginalsLabel.
  ///
  /// In en, this message translates to:
  /// **'Keep Originals'**
  String get keepOriginalsLabel;

  /// No description provided for @keepOriginalsDesc.
  ///
  /// In en, this message translates to:
  /// **'Keeps the original videos untouched after compression.'**
  String get keepOriginalsDesc;

  /// No description provided for @toRecycleBinLabel.
  ///
  /// In en, this message translates to:
  /// **'To Recycle Bin'**
  String get toRecycleBinLabel;

  /// No description provided for @toRecycleBinDesc.
  ///
  /// In en, this message translates to:
  /// **'Moves originals to the Recycle Bin after successful compression.'**
  String get toRecycleBinDesc;

  /// No description provided for @outputFormatTitle.
  ///
  /// In en, this message translates to:
  /// **'Output Format (Container)'**
  String get outputFormatTitle;

  /// No description provided for @formatOriginalLabel.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get formatOriginalLabel;

  /// No description provided for @formatOriginalDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep original format (Fastest, no container changes).'**
  String get formatOriginalDesc;

  /// No description provided for @formatMp4Label.
  ///
  /// In en, this message translates to:
  /// **'MP4'**
  String get formatMp4Label;

  /// No description provided for @formatMp4Desc.
  ///
  /// In en, this message translates to:
  /// **'Maximum compatibility across all devices and web browsers.'**
  String get formatMp4Desc;

  /// No description provided for @formatMkvLabel.
  ///
  /// In en, this message translates to:
  /// **'MKV'**
  String get formatMkvLabel;

  /// No description provided for @formatMkvDesc.
  ///
  /// In en, this message translates to:
  /// **'Resilient format, great for multiple audio/subtitle tracks.'**
  String get formatMkvDesc;

  /// No description provided for @formatMovLabel.
  ///
  /// In en, this message translates to:
  /// **'MOV'**
  String get formatMovLabel;

  /// No description provided for @formatMovDesc.
  ///
  /// In en, this message translates to:
  /// **'High quality Apple QuickTime format, great for editing.'**
  String get formatMovDesc;

  /// No description provided for @scanningFilesMsg.
  ///
  /// In en, this message translates to:
  /// **'Scanning files... This may take a moment.'**
  String get scanningFilesMsg;

  /// No description provided for @addFilesBtn.
  ///
  /// In en, this message translates to:
  /// **'Add Files'**
  String get addFilesBtn;

  /// No description provided for @addFolderBtn.
  ///
  /// In en, this message translates to:
  /// **'Add Folder'**
  String get addFolderBtn;

  /// No description provided for @dragDropMoreMsg.
  ///
  /// In en, this message translates to:
  /// **'Or drag & drop more videos anywhere'**
  String get dragDropMoreMsg;

  /// No description provided for @openOutputFolderTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open Output Folder'**
  String get openOutputFolderTooltip;

  /// No description provided for @statusQueued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get statusQueued;

  /// No description provided for @statusAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing'**
  String get statusAnalyzing;

  /// No description provided for @statusCompressing.
  ///
  /// In en, this message translates to:
  /// **'Compressing'**
  String get statusCompressing;

  /// No description provided for @statusDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get statusDone;

  /// No description provided for @statusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get statusFailed;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @savedPrefix.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get savedPrefix;

  /// No description provided for @largerSuffix.
  ///
  /// In en, this message translates to:
  /// **'Larger'**
  String get largerSuffix;

  /// No description provided for @largerSizeWarning.
  ///
  /// In en, this message translates to:
  /// **'Output size might be larger than original. Consider cancelling and resetting settings to default.'**
  String get largerSizeWarning;

  /// No description provided for @clearCompletedBtn.
  ///
  /// In en, this message translates to:
  /// **'Clear Completed'**
  String get clearCompletedBtn;

  /// No description provided for @clearAllBtn.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAllBtn;

  /// No description provided for @stopAllBtn.
  ///
  /// In en, this message translates to:
  /// **'Stop All'**
  String get stopAllBtn;

  /// No description provided for @startCompressionBtn.
  ///
  /// In en, this message translates to:
  /// **'Start Compression'**
  String get startCompressionBtn;

  /// No description provided for @allDoneLabel.
  ///
  /// In en, this message translates to:
  /// **'All Done!'**
  String get allDoneLabel;

  /// No description provided for @openFolderBtn.
  ///
  /// In en, this message translates to:
  /// **'Open Folder'**
  String get openFolderBtn;

  /// No description provided for @totalEtaLabel.
  ///
  /// In en, this message translates to:
  /// **'Total ETA'**
  String get totalEtaLabel;

  /// No description provided for @totalSavedLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Saved'**
  String get totalSavedLabel;

  /// No description provided for @videoSingle.
  ///
  /// In en, this message translates to:
  /// **'video'**
  String get videoSingle;

  /// No description provided for @videosPlural.
  ///
  /// In en, this message translates to:
  /// **'videos'**
  String get videosPlural;

  /// No description provided for @releaseToAddVideosMsg.
  ///
  /// In en, this message translates to:
  /// **'Release to add videos'**
  String get releaseToAddVideosMsg;

  /// No description provided for @dragDropHereMsg.
  ///
  /// In en, this message translates to:
  /// **'Drag & drop video files or folders here'**
  String get dragDropHereMsg;

  /// No description provided for @supportedFormatsMsg.
  ///
  /// In en, this message translates to:
  /// **'Seamlessly supports MP4, MKV, MOV, AVI, WMV'**
  String get supportedFormatsMsg;

  /// No description provided for @selectFilesBtn.
  ///
  /// In en, this message translates to:
  /// **'Select Files'**
  String get selectFilesBtn;

  /// No description provided for @selectFolderBtn.
  ///
  /// In en, this message translates to:
  /// **'Select Folder'**
  String get selectFolderBtn;

  /// No description provided for @releaseToShrinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Release to Shrink'**
  String get releaseToShrinkTitle;

  /// No description provided for @filesWillBeAddedDesc.
  ///
  /// In en, this message translates to:
  /// **'Your files will be added to the queue.'**
  String get filesWillBeAddedDesc;

  /// No description provided for @disabledLabel.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabledLabel;

  /// No description provided for @compressionInProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Compression in Progress'**
  String get compressionInProgressTitle;

  /// No description provided for @confirmCloseDesc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to close Shrinkeo?\nThis will cancel all current compressions and you might lose your progress.'**
  String get confirmCloseDesc;

  /// No description provided for @keepCompressingBtn.
  ///
  /// In en, this message translates to:
  /// **'Keep Compressing'**
  String get keepCompressingBtn;

  /// No description provided for @closeAppBtn.
  ///
  /// In en, this message translates to:
  /// **'Close App'**
  String get closeAppBtn;

  /// No description provided for @lockedSettingsWarning.
  ///
  /// In en, this message translates to:
  /// **'Locked during compression'**
  String get lockedSettingsWarning;

  /// No description provided for @updateRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get updateRequiredTitle;

  /// No description provided for @updateRequiredDescNewVersion.
  ///
  /// In en, this message translates to:
  /// **'A new version of Shrinkeo is available with important improvements. Please update to continue.'**
  String get updateRequiredDescNewVersion;

  /// No description provided for @updateRequiredDescOldVersion.
  ///
  /// In en, this message translates to:
  /// **'Your version is no longer supported. Please update to continue using the app.'**
  String get updateRequiredDescOldVersion;

  /// No description provided for @updateNowBtn.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNowBtn;

  /// No description provided for @laterBtn.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get laterBtn;

  /// No description provided for @updateAvailableTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailableTitle;

  /// No description provided for @whatsNewTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s New:'**
  String get whatsNewTitle;

  /// No description provided for @exitAppBtn.
  ///
  /// In en, this message translates to:
  /// **'Exit App'**
  String get exitAppBtn;

  /// No description provided for @retryBtn.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryBtn;

  /// No description provided for @downloadFromWebsiteBtn.
  ///
  /// In en, this message translates to:
  /// **'Download from Website'**
  String get downloadFromWebsiteBtn;

  /// No description provided for @skipUpdateConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Skip Critical Update?'**
  String get skipUpdateConfirmTitle;

  /// No description provided for @skipUpdateConfirmDesc.
  ///
  /// In en, this message translates to:
  /// **'This update contains critical bug fixes and improvements. We highly recommend updating now to ensure the app functions correctly.\n\nAre you sure you want to skip it for now?'**
  String get skipUpdateConfirmDesc;

  /// No description provided for @skipUpdateCancelBtn.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get skipUpdateCancelBtn;

  /// No description provided for @skipUpdateConfirmBtn.
  ///
  /// In en, this message translates to:
  /// **'I understand, Skip it'**
  String get skipUpdateConfirmBtn;

  /// No description provided for @maintenanceTitle.
  ///
  /// In en, this message translates to:
  /// **'System Maintenance'**
  String get maintenanceTitle;

  /// No description provided for @maintenanceDescDefault.
  ///
  /// In en, this message translates to:
  /// **'Shrinkeo is currently undergoing maintenance. Please try again later.'**
  String get maintenanceDescDefault;

  /// No description provided for @versionAvailableMsg.
  ///
  /// In en, this message translates to:
  /// **'Version {version} is now available.'**
  String versionAvailableMsg(String version);

  /// No description provided for @hwEncoderNotSupportedTitle.
  ///
  /// In en, this message translates to:
  /// **'Hardware Encoder Not Supported'**
  String get hwEncoderNotSupportedTitle;

  /// No description provided for @failedCreateFolderError.
  ///
  /// In en, this message translates to:
  /// **'Failed to create output folder'**
  String get failedCreateFolderError;

  /// No description provided for @failedProbeDurationError.
  ///
  /// In en, this message translates to:
  /// **'Failed to probe duration'**
  String get failedProbeDurationError;

  /// No description provided for @ffmpegNotFoundGlobalError.
  ///
  /// In en, this message translates to:
  /// **'FFmpeg was not found. Please ensure FFmpeg is bundled in the data directory.'**
  String get ffmpegNotFoundGlobalError;

  /// No description provided for @ffmpegMissingError.
  ///
  /// In en, this message translates to:
  /// **'FFmpeg or FFprobe is missing or corrupted.\n\nPlease reinstall Shrinkeo or manually fix the installation using:\nwinget install Gyan.FFmpeg'**
  String get ffmpegMissingError;

  /// No description provided for @hwFallbackNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'{encoderLabel} failed. Automatically switched to Software (CPU) encoding.'**
  String hwFallbackNotificationBody(String encoderLabel);

  /// No description provided for @failedDownloadUpdateMsg.
  ///
  /// In en, this message translates to:
  /// **'Failed to download update. Please try again.'**
  String get failedDownloadUpdateMsg;

  /// No description provided for @customRatioActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom Ratio ({ratio})'**
  String customRatioActiveTitle(Object ratio);

  /// No description provided for @customRatioActiveDesc.
  ///
  /// In en, this message translates to:
  /// **'Padded canvas for custom {ratio} ratio.'**
  String customRatioActiveDesc(Object ratio);

  /// No description provided for @customAngleActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom Angle ({angle}°)'**
  String customAngleActiveTitle(Object angle);

  /// No description provided for @customAngleActiveDesc.
  ///
  /// In en, this message translates to:
  /// **'Rotates video by custom {angle}° degree angle.'**
  String customAngleActiveDesc(Object angle);

  /// No description provided for @trimActiveDesc.
  ///
  /// In en, this message translates to:
  /// **'Cuts video clip between {start} and {end}.'**
  String trimActiveDesc(Object end, Object start);

  /// No description provided for @targetSizeLimitLabel.
  ///
  /// In en, this message translates to:
  /// **'{size} MB Limit'**
  String targetSizeLimitLabel(Object size);

  /// No description provided for @customMbSizeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Type custom MB size'**
  String get customMbSizeTooltip;

  /// No description provided for @trimTimeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter time e.g. 5 (5s), 1:30 (1m30s), or 00:01:30'**
  String get trimTimeTooltip;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fi',
    'fil',
    'fr',
    'gu',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'kn',
    'ko',
    'ml',
    'mr',
    'ms',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sr',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

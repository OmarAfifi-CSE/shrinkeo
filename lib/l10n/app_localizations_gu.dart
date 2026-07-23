// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'કુલ બચાવેલ જગ્યા';

  @override
  String get savedSpacePrefix => 'બચાવેલ:';

  @override
  String get supportButtonText => 'Support Project';

  @override
  String get lightThemeTooltip => 'લાઇટ થીમ';

  @override
  String get darkThemeTooltip => 'ડાર્ક થીમ';

  @override
  String get settingsTooltip => 'સેટિંગ્સ';

  @override
  String get minimizeTooltip => 'નાનું કરો';

  @override
  String get closeTooltip => 'બંધ કરો';

  @override
  String get restoreTooltip => 'પુનર્સ્થાપિત કરો';

  @override
  String get maximizeTooltip => 'મોટું કરો';

  @override
  String get tabCompressionQuality => 'કોમ્પ્રેસન અને ગુણવત્તા';

  @override
  String get tabVideoEditingTools => 'વિડિઓ એડિટિંગ અને સાધનો';

  @override
  String get tabAudioSettings => 'ઓડિયો સેટિંગ્સ';

  @override
  String get tabEngineOutput => 'એન્જિન અને આઉટપુટ ફોલ્ડર';

  @override
  String get compressionSettingsTitle => 'કોમ્પ્રેસન સેટિંગ્સ';

  @override
  String get resetToDefaults => 'ડિફૉલ્ટ પર રીસેટ કરો';

  @override
  String get resetDefaultTooltip => 'મૂળ મૂલ્યો પર રીસેટ કરો';

  @override
  String get modeTargetSizeTitle => 'કોમ્પ્રેસન મોડ';

  @override
  String get modeCrfLabel => 'ગુણવત્તા (CRF)';

  @override
  String get modeTargetSizeLabel => 'ટાર્ગેટ સાઈઝ (MB)';

  @override
  String get crfQualityTitle => 'CRF ગુણવત્તા પરિબળ';

  @override
  String get targetSizeLabel => 'ટાર્ગેટ ફાઇલ સાઈઝ (MB)';

  @override
  String get targetSizeDesc => 'સાઈઝ મર્યાદામાં ફિટ કરવા માટે બિટરેટ ગણે છે.';

  @override
  String get encodingSpeedTitle => 'એનકોડિંગ ઝડપ';

  @override
  String get presetUltrafastLabel => 'અતિ ઝડપી';

  @override
  String get presetUltrafastDesc => 'મહત્તમ ઝડપ, પણ ઓછી સાઈઝ ઘટાડો.';

  @override
  String get presetSuperfastLabel => 'સુપર ફાસ્ટ';

  @override
  String get presetSuperfastDesc => 'ખૂબ જ ઝડપી એનકોડિંગ.';

  @override
  String get presetVeryfastLabel => 'ખૂબ ઝડપી';

  @override
  String get presetVeryfastDesc => 'સરેરાશ કરતાં ઝડપી.';

  @override
  String get presetFasterLabel => 'વધુ ઝડપી';

  @override
  String get presetFasterDesc => 'સારી ઝડપ અને ઉત્તમ કોમ્પ્રેસન.';

  @override
  String get presetFastLabel => 'ઝડપી';

  @override
  String get presetFastDesc => 'ઝડપ અને સાઈઝનું શ્રેષ્ઠ સંતુલન.';

  @override
  String get presetMediumLabel => 'મધ્યમ';

  @override
  String get presetMediumDesc => 'ડિફૉલ્ટ સંતુલન.';

  @override
  String get presetSlowLabel => 'ધીમું';

  @override
  String get presetSlowDesc => 'ધીમું પણ નોંધપાત્ર રીતે નાની ફાઇલો.';

  @override
  String get presetVeryslowLabel => 'ખૂબ ધીમું';

  @override
  String get presetVeryslowDesc => 'મહત્તમ સાઈઝ ઘટાડો.';

  @override
  String get videoCodecTitle => 'વિડિઓ કોડેક';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'મહત્તમ સુસંગતતા.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'વધુ સારી કોમ્પ્રેસન ક્ષમતા.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'નવી પેઢીનું કોડેક (H.265 કરતાં 30% નાનું).';

  @override
  String get hardwareEncoderTitle => 'હાર્ડવેર પ્રવેગક (GPU)';

  @override
  String get hwSoftwareLabel => 'સોફ્ટવેર (CPU)';

  @override
  String get hwSoftwareDesc => 'સૌથી ધીમું, પણ સર્વોચ્ચ સુસંગતતા.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPU માટે ખૂબ જ ઝડપી એનકોડિંગ.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPU માટે ખૂબ જ ઝડપી એનકોડિંગ.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPU માટે ખૂબ જ ઝડપી એનકોડિંગ.';

  @override
  String get resolutionTitle => 'મહત્તમ રીઝોલ્યુશન';

  @override
  String get resOriginalLabel => 'મૂળ';

  @override
  String get resOriginalDesc => 'મૂળ રીઝોલ્યુશન રાખો.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'મહત્તમ 4K સુધી ઘટાડો.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'મહત્તમ 2K સુધી ઘટાડો.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'મહત્તમ 1080p Full HD સુધી ઘટાડો.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'મહત્તમ 720p HD સુધી ઘટાડો.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '480p સુધી ઘટાડો.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'મહત્તમ કોમ્પ્રેસન.';

  @override
  String get frameRateTitle => 'ફ્રેમ રેટ (FPS)';

  @override
  String get fpsOriginalLabel => 'મૂળ';

  @override
  String get fpsOriginalDesc => 'સોર્સ વિડિઓ જેવો જ FPS.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'ગેમિંગ અથવા સ્પોર્ટ્સ માટે સ્મૂથ.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'મોટાભાગના વિડિઓ માટે પ્રમાણભૂત.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'સિનેમેટિક શૈલી.';

  @override
  String get enableVideoDenoiseTitle => 'વિડિઓ નોઈઝ સફાઈ';

  @override
  String get enableVideoDenoiseDesc => 'નોઈઝ ઘટાડવા માટે 3D ફિલ્ટર.';

  @override
  String get exportFormatTitle => 'નિકાસ ફોર્મેટ';

  @override
  String get exportVideoLabel => 'પ્રમાણભૂત વિડિઓ';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOV તરીકે નિકાસ કરો';

  @override
  String get exportGifLabel => 'એનિમેટેડ GIF';

  @override
  String get exportGifDesc => 'ઉચ્ચ ગુણવત્તાની GIF બનાવો';

  @override
  String get exportMp3Label => 'MP3 મેળવો';

  @override
  String get exportMp3Desc => 'ઓડિયો 320kbps MP3 તરીકે મેળવો';

  @override
  String get exportAacLabel => 'AAC મેળવો';

  @override
  String get exportAacDesc => 'ઓડિયો AAC તરીકે મેળવો';

  @override
  String get exportWavLabel => 'WAV મેળવો';

  @override
  String get exportWavDesc => 'અનકોમ્પ્રેસ્ડ WAV ઓડિયો મેળવો';

  @override
  String get privacyScrubbingTitle => 'ગોપનીયતા અને GPS';

  @override
  String get keepMetadataLabel => 'ડેટા રાખો';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF હટાવો';

  @override
  String get stripGpsExifInfoTitle => 'મેટાડેટા સાફ કરો';

  @override
  String get stripGpsExifInfoDesc => 'કેમેરા માહિતી અને GPS સ્થાન હટાવે છે.';

  @override
  String get keepMetadataInfoDesc => 'તમામ મૂળ મેટાડેટા જાળવી રાખે છે.';

  @override
  String get autoCropBlackBarsTitle => 'કાળી પટ્ટીઓ આપોઆપ ક્રોપ કરો';

  @override
  String get autoCropLabel => 'ઓટો ક્રોપ';

  @override
  String get autoCropActiveTitle => 'ઓટો ક્રોપ સક્રિય';

  @override
  String get autoCropActiveDesc => 'કાળી પટ્ટીઓ આપોઆપ હટાવે છે.';

  @override
  String get autoCropDisabledDesc => 'મૂળ કિનારીઓ જાળવી રાખે છે.';

  @override
  String get playbackSpeedTitle => 'પ્લેબેક ઝડપ';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'સામાન્ય ઝડપ';

  @override
  String get speedSlow05Label => '0.5x ધીમું';

  @override
  String get speedSlow05Desc => 'અડધી ઝડપે ચલાવો';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 ગણું ઝડપી';

  @override
  String get speedFast20Label => '2.0x ઝડપી';

  @override
  String get speedFast20Desc => 'બમણી ઝડપ';

  @override
  String get speedTimelapse40Label => '4.0x ટાઇમલેપ્સ';

  @override
  String get speedTimelapse40Desc => 'ટાઇમલેપ્સ માટે 4x ઝડપ';

  @override
  String get canvasAspectRatioTitle => 'આસ્પેક્ટ રેશિયો';

  @override
  String get aspectOriginalLabel => 'મૂળ';

  @override
  String get aspectOriginalDesc => 'મૂળ રેશિયો રાખો';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'TikTok અને Reels માટે';

  @override
  String get aspectSquareLabel => '1:1 ચોરસ';

  @override
  String get aspectSquareDesc => 'Instagram પોસ્ટ માટે';

  @override
  String get aspectPortraitLabel => '4:5 પોટ્રેટ';

  @override
  String get aspectPortraitDesc => 'ઉભા Instagram માટે';

  @override
  String get aspectWidescreenLabel => '16:9 વાઇડસ્ક્રીન';

  @override
  String get aspectWidescreenDesc => 'YouTube અને ટીવી માટે';

  @override
  String get aspectClassicLabel => '4:3 ક્લાસિક';

  @override
  String get aspectClassicDesc => 'ક્લાસિક સ્ક્રીન માટે';

  @override
  String get aspectCinemaLabel => '21:9 સિનેમા';

  @override
  String get aspectCinemaDesc => 'અલ્ટ્રાવાઇડ મોનિટર માટે';

  @override
  String get aspectCustomLabel => 'કસ્ટમ રેશિયો';

  @override
  String get aspectCustomDesc => 'તમારો પસંદગીનો રેશિયો';

  @override
  String get customRatioTooltip => 'ઉદા: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'રોટેશન અને ફેરવો';

  @override
  String get rotOriginalLabel => 'મૂળ (0°)';

  @override
  String get rotOriginalDesc => 'મૂળ દિશા રાખો';

  @override
  String get rot90Label => '90° જમણે';

  @override
  String get rot90Desc => 'ઘડિયાળની દિશામાં 90 ડિગ્રી ફેરવો';

  @override
  String get rot180Label => '180° ઊંધું';

  @override
  String get rot180Desc => 'ઊંધું ફેરવો';

  @override
  String get rot270Label => '270° ડાબે';

  @override
  String get rot270Desc => 'ઘડિયાળની વિરુદ્ધ દિશામાં 90 ડિગ્રી ફેરવો';

  @override
  String get rotFlipHLabel => 'આડું અરીસા સમાન';

  @override
  String get rotFlipHDesc => 'આડું ફેરવો';

  @override
  String get rotFlipVLabel => 'ઉભું અરીસા સમાન';

  @override
  String get rotFlipVDesc => 'ઉભું ફેરવો';

  @override
  String get rotCustomLabel => 'કસ્ટમ એંગલ';

  @override
  String get rotCustomDesc => 'ચોક્કસ એંગલ પર ફેરવો';

  @override
  String get customRotationTooltip => 'ડિગ્રીમાં એંગલ ઉદા. 45';

  @override
  String get trimVideoTitle => 'વિડિઓ ટ્રીમ કરો';

  @override
  String get fullVideoLabel => 'સંપૂર્ણ વિડિઓ';

  @override
  String get cutClipLabel => 'ક્લિપ કાપો';

  @override
  String get trimStartLabel => 'શરૂઆત';

  @override
  String get trimEndLabel => 'અંત';

  @override
  String get trimActiveTitle => 'ટ્રીમિંગ સક્રિય';

  @override
  String get fullVideoDesc => 'કાપ્યા વગર સંપૂર્ણ વિડિઓ પ્રોસેસ કરો.';

  @override
  String get audioModeTitle => 'ઓડિયો ટ્રેક મોડ';

  @override
  String get audioOriginalLabel => 'મૂળ';

  @override
  String get audioOriginalDesc => 'ઓડિયો ગુણવત્તામાં કોઈ ઘટાડો નહીં.';

  @override
  String get audioAac256Label => 'ઉચ્ચ ગુણવત્તા (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'સંતુલિત (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (વેબ માનક)';

  @override
  String get audioAac64Label => 'ઓછી સાઈઝ (64k)';

  @override
  String get audioAac64Desc => 'અવાજ માટે AAC 64kbps';

  @override
  String get audioMuteLabel => 'ઓડિયો મ્યૂટ કરો';

  @override
  String get audioMuteDesc => 'ઓડિયો ટ્રેક સંપૂર્ણપણે હટાવો.';

  @override
  String get audioNormTitle => 'અવાજ સ્તર સમાન કરવું';

  @override
  String get audioNormOffLabel => 'બંધ';

  @override
  String get audioNormOffDesc => 'મૂળ અવાજ સ્તર.';

  @override
  String get audioNormSpeechLabel => 'માનવ અવાજ';

  @override
  String get audioNormSpeechDesc => 'સ્પષ્ટ વાતચીત માટે EBU R128.';

  @override
  String get audioNormDynamicLabel => 'સિનેમા ડાયનેમિક';

  @override
  String get audioNormDynamicDesc => 'ધીમા અને મોટા અવાજોને સંતુલિત કરે છે.';

  @override
  String get audioNormBoostLabel => 'હળવો વધારો';

  @override
  String get audioNormBoostDesc => '+3dB અવાજ વધારો.';

  @override
  String get audioChanTitle => 'ઓડિયો ચેનલો';

  @override
  String get audioChanOriginalLabel => 'મૂળ';

  @override
  String get audioChanOriginalDesc => 'મૂળ ચેનલો જાળવી રાખો.';

  @override
  String get audioChanStereoLabel => 'સ્ટીરિયો (2.0)';

  @override
  String get audioChanStereoDesc => 'પ્રમાણભૂત 2-ચેનલ સ્ટીરિયો.';

  @override
  String get audioChanMonoLabel => 'મોનો (1.0)';

  @override
  String get audioChanMonoDesc => 'એક ચેનલ - ઓડિયો સાઈઝમાં 50% બચત.';

  @override
  String get removeNoiseLabel => 'નોઈઝ હટાવો';

  @override
  String get enableAudioDenoiseTitle => 'માઇકનો નોઈઝ હટાવો';

  @override
  String get enableAudioDenoiseDesc => 'બેકગ્રાઉન્ડ નોઈઝ હટાવવા માટે ફિલ્ટર.';

  @override
  String get outputDirectoryTitle => 'આઉટપુટ ફોલ્ડર';

  @override
  String get defaultOutputDirectory => 'ડિફૉલ્ટ (મૂળ ફાઇલની બાજુમાં)';

  @override
  String get selectOutputFolderTitle => 'ફોલ્ડર પસંદ કરો';

  @override
  String get clearOutputFolder => 'ડિફૉલ્ટ સ્થાન વાપરો';

  @override
  String get changeBtn => 'બદલો';

  @override
  String get outputLocationTitle => 'આઉટપુટ વર્તણૂક';

  @override
  String get outputLocationUnifiedLabel => 'એક જ ફોલ્ડર';

  @override
  String get outputLocationUnifiedDesc =>
      'તમામ કોમ્પ્રેસ્ડ વિડિઓ એક જ ફોલ્ડરમાં.';

  @override
  String get outputLocationSameLabel => 'મૂળ ફાઇલની બાજુમાં';

  @override
  String get outputLocationSameDesc => 'દરેક વિડિઓ તેની મૂળ ફાઇલની બાજુમાં.';

  @override
  String get fileManagementTitle => 'ફાઇલ વ્યવસ્થાપન';

  @override
  String get keepOriginalsLabel => 'મૂળ ફાઇલો રાખો';

  @override
  String get keepOriginalsDesc => 'મૂળ ફાઇલોને સ્પર્શ કર્યા વગર રાખો.';

  @override
  String get toRecycleBinLabel => 'રિસાયકલ બિનમાં મોકલો';

  @override
  String get toRecycleBinDesc =>
      'કોમ્પ્રેસ કર્યા પછી મૂળ ફાઇલો રિસાયકલ બિનમાં મોકલો.';

  @override
  String get outputFormatTitle => 'કન્ટેનર ફોર્મેટ';

  @override
  String get formatOriginalLabel => 'મૂળ';

  @override
  String get formatOriginalDesc => 'મૂળ ફોર્મેટ જાળવી રાખો.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'મહત્તમ સુસંગતતા.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'મલ્ટિ-ટ્રેક સપોર્ટ.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime ફોર્મેટ.';

  @override
  String get scanningFilesMsg => 'ફાઇલો સ્કેન કરી રહ્યું છે...';

  @override
  String get addFilesBtn => 'ફાઇલો ઉમેરો';

  @override
  String get addFolderBtn => 'ફોલ્ડર ઉમેરો';

  @override
  String get dragDropMoreMsg => 'અથવા વધુ વિડિઓ અહીં ડ્રેગ અને ડ્રોપ કરો';

  @override
  String get openOutputFolderTooltip => 'આઉટપુટ ફોલ્ડર ખોલો';

  @override
  String get statusQueued => 'લાઇનમાં છે';

  @override
  String get statusAnalyzing => 'વિશ્લેષણ કરી રહ્યું છે';

  @override
  String get statusCompressing => 'કોમ્પ્રેસ કરી રહ્યું છે';

  @override
  String get statusDone => 'પૂર્ણ થયું';

  @override
  String get statusFailed => 'નિષ્ફળ';

  @override
  String get statusCancelled => 'રદ કર્યું';

  @override
  String get savedPrefix => 'બચાવેલ';

  @override
  String get largerSuffix => 'મોટું';

  @override
  String get largerSizeWarning => 'આઉટપુટ સાઈઝ મૂળ કરતાં મોટી હોઈ શકે છે.';

  @override
  String get clearCompletedBtn => 'પૂર્ણ થયેલ સાફ કરો';

  @override
  String get clearAllBtn => 'તમામ સાફ કરો';

  @override
  String get stopAllBtn => 'તમામ અટકાવો';

  @override
  String get startCompressionBtn => 'કોમ્પ્રેસન શરૂ કરો';

  @override
  String get allDoneLabel => 'તમામ પૂર્ણ થયું!';

  @override
  String get openFolderBtn => 'ફોલ્ડર ખોલો';

  @override
  String get totalEtaLabel => 'બાકી સમય';

  @override
  String get totalSavedLabel => 'કુલ બચાવેલ';

  @override
  String get videoSingle => 'વિડિઓ';

  @override
  String get videosPlural => 'વિડિઓઝ';

  @override
  String get releaseToAddVideosMsg => 'વિડિઓ ઉમેરવા માટે છોડો';

  @override
  String get dragDropHereMsg => 'ફાઇલો અથવા ફોલ્ડર્સ અહીં ડ્રેગ અને ડ્રોપ કરો';

  @override
  String get supportedFormatsMsg => 'MP4, MKV, MOV, AVI, WMV સપોર્ટેડ';

  @override
  String get selectFilesBtn => 'ફાઇલો પસંદ કરો';

  @override
  String get selectFolderBtn => 'ફોલ્ડર પસંદ કરો';

  @override
  String get releaseToShrinkTitle => 'તરત જ કોમ્પ્રેસ કરવા માટે છોડો';

  @override
  String get filesWillBeAddedDesc => 'તમારી ફાઇલો લાઇનમા ઉમેરાશે.';

  @override
  String get disabledLabel => 'નિષ્ક્રિય';

  @override
  String get compressionInProgressTitle => 'કોમ્પ્રેસન ચાલુ છે';

  @override
  String get confirmCloseDesc => 'શું તમે ચોક્કસ Shrinkeo બંધ કરવા માંગો છો?';

  @override
  String get keepCompressingBtn => 'કોમ્પ્રેસન ચાલુ રાખો';

  @override
  String get closeAppBtn => 'એપ બંધ કરો';

  @override
  String get lockedSettingsWarning => 'કોમ્પ્રેસન દરમિયાન લોક થયેલ છે';

  @override
  String get updateRequiredTitle => 'અપડેટ જરૂરી છે';

  @override
  String get updateRequiredDescNewVersion => 'નવું વર્ઝન ઉપલબ્ધ છે.';

  @override
  String get updateRequiredDescOldVersion => 'તમારું વર્ઝન હવે સપોર્ટેડ નથી.';

  @override
  String get updateNowBtn => 'હમણાં જ અપડેટ કરો';

  @override
  String get laterBtn => 'પછીથી';

  @override
  String get updateAvailableTitle => 'અપડેટ ઉપલબ્ધ છે';

  @override
  String get whatsNewTitle => 'નવું શું છે:';

  @override
  String get exitAppBtn => 'બહાર નીકળો';

  @override
  String get retryBtn => 'ફરી પ્રયાસ કરો';

  @override
  String get downloadFromWebsiteBtn => 'વેબસાઇટ પરથી ડાઉનલોડ કરો';

  @override
  String get skipUpdateConfirmTitle => 'અપડેટ છોડી દેવું?';

  @override
  String get skipUpdateConfirmDesc => 'આ અપડેટમાં મહત્વપૂર્ણ સુધારાઓ છે.';

  @override
  String get skipUpdateCancelBtn => 'રદ કરો';

  @override
  String get skipUpdateConfirmBtn => 'અપડેટ છોડી દો';

  @override
  String get maintenanceTitle => 'નિભાવ';

  @override
  String get maintenanceDescDefault => 'Shrinkeo હાલમાં નિભાવ હેઠળ છે.';

  @override
  String versionAvailableMsg(String version) {
    return 'વર્ઝન $version ઉપલબ્ધ છે.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'હાર્ડવેર પ્રવેગક સપોર્ટેડ નથી';

  @override
  String get failedCreateFolderError => 'ફોલ્ડર બનાવવામાં નિષ્ફળતા';

  @override
  String get failedProbeDurationError => 'સમયગાળો ઓળખવામાં નિષ્ફળતા';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg મળ્યું નથી.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg અથવા FFprobe ગાયબ અથવા ક્ષતિગ્રસ્ત છે.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel નિષ્ફળ ગયું. CPU પર સ્વિચ કર્યું.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'અપડેટ ડાઉનલોડ કરવામાં નિષ્ફળતા. ફરી પ્રયાસ કરો.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Custom Ratio ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Padded canvas for custom $ratio ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Custom Angle ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Rotates video by custom $angle° degree angle.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Cuts video clip between $start and $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return '$size MB Limit';
  }

  @override
  String get customMbSizeTooltip => 'Type custom MB size';

  @override
  String get trimTimeTooltip =>
      'Enter time e.g. 5 (5s), 1:30 (1m30s), or 00:01:30';
}

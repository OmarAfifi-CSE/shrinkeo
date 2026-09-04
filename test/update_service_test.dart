import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:shrinkeo/services/update_service.dart';

/// Unit tests for UpdateService with a fully mocked HTTP layer (no network).
///
/// The package_info_plus plugin channel is mocked to report a local version
/// of 1.2.0 so release-comparison logic is deterministic.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const packageInfoChannel = MethodChannel(
    'dev.fluttercommunity.plus/package_info',
  );

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(packageInfoChannel, (call) async {
      return {
        'name': 'Shrinkeo',
        'packageName': 'com.example.shrinkeo',
        'version': '1.2.0',
        'buildNumber': '6',
        'buildSignature': '',
        'installerStore': null,
      };
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(packageInfoChannel, null);
  });

  Map<String, dynamic> release({
    String tag = 'v1.3.0',
    String? body,
    List<Map<String, String>>? assets,
  }) {
    return {
      'tag_name': tag,
      'body': body ?? 'Bug fixes and improvements.',
      'assets': assets ??
          [
            {
              'name': 'Shrinkeo-Setup.exe',
              'browser_download_url':
                  'https://github.com/x/releases/download/Shrinkeo-Setup.exe',
            },
          ],
    };
  }

  group('getLatestDownloadUrl', () {
    test('extracts the Windows .exe asset URL', () async {
      final client = MockClient(
        (_) async => http.Response(jsonEncode([release()]), 200),
      );

      final url = await UpdateService.getLatestDownloadUrl(client: client);
      expect(
        url,
        'https://github.com/x/releases/download/Shrinkeo-Setup.exe',
      );
    });

    test('returns null when the release has no .exe asset', () async {
      final client = MockClient(
        (_) async => http.Response(
          jsonEncode([
            release(assets: [
              {'name': 'source.zip', 'browser_download_url': 'https://x/z.zip'},
            ]),
          ]),
          200,
        ),
      );

      expect(await UpdateService.getLatestDownloadUrl(client: client), isNull);
    });

    test('returns null on HTTP failure', () async {
      final client = MockClient((_) async => http.Response('boom', 500));
      expect(await UpdateService.getLatestDownloadUrl(client: client), isNull);
    });

    test('returns null when the client throws (offline)', () async {
      final client = MockClient((_) async => throw Exception('offline'));
      expect(await UpdateService.getLatestDownloadUrl(client: client), isNull);
    });
  });

  group('version comparison & release notes', () {
    test('aggregates notes for every newer release', () async {
      final client = MockClient(
        (_) async => http.Response(
          jsonEncode([
            release(
              tag: 'v1.4.0',
              body: 'New AV1 pipeline.',
            ),
            release(
              tag: 'v1.3.0',
              body: 'Image suite added.',
            ),
          ]),
          200,
        ),
      );

      final notes =
          await UpdateService.getAggregatedReleaseNotes(client: client);
      expect(notes, isNotNull);
      expect(notes, contains('v1.4.0'));
      expect(notes, contains('New AV1 pipeline.'));
      expect(notes, contains('v1.3.0'));
      expect(notes, contains('Image suite added.'));
      // Newest release comes first.
      expect(notes!.indexOf('v1.4.0'), lessThan(notes.indexOf('v1.3.0')));
    });

    test('ignores releases that are not newer than the local version',
        () async {
      final client = MockClient(
        (_) async => http.Response(
          jsonEncode([release(tag: 'v1.2.0', body: 'current release')]),
          200,
        ),
      );

      expect(
        await UpdateService.getAggregatedReleaseNotes(client: client),
        isNull,
      );
    });

    test('compares versions numerically (1.10.0 > 1.2.0)', () async {
      final client = MockClient(
        (_) async => http.Response(
          jsonEncode([release(tag: 'v1.10.0')]),
          200,
        ),
      );

      final notes =
          await UpdateService.getAggregatedReleaseNotes(client: client);
      expect(notes, isNotNull, reason: '1.10.0 must be treated as newer');
    });

    test('strips pre-release tags before comparing (v1.3.0-beta -> 1.3.0)',
        () async {
      final client = MockClient(
        (_) async => http.Response(
          jsonEncode([release(tag: 'v1.3.0-beta')]),
          200,
        ),
      );

      final notes =
          await UpdateService.getAggregatedReleaseNotes(client: client);
      expect(notes, isNotNull, reason: 'pre-release of 1.3.0 is still newer');
    });

    test('returns null on HTTP failure', () async {
      final client = MockClient((_) async => http.Response('boom', 403));
      expect(
        await UpdateService.getAggregatedReleaseNotes(client: client),
        isNull,
      );
    });
  });
}

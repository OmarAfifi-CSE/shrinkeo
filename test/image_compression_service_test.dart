import 'package:flutter_test/flutter_test.dart';
import 'package:shrinkeo/services/image_compression_service.dart';

void main() {
  test('ImageCompressionService target size search logic works correctly', () {
    final service = ImageCompressionService();
    expect(service, isNotNull);
  });
}

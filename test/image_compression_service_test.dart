import 'package:flutter_test/flutter_test.dart';
import 'package:shrinkeo/services/image_compression_service.dart';

void main() {
  test('ImageCompressionService constructs with default dependencies', () {
    final service = ImageCompressionService();
    expect(service, isNotNull);
  });
}

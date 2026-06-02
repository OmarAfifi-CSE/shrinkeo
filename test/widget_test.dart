import 'package:flutter_test/flutter_test.dart';
import 'package:shrinkeo/main.dart';

void main() {
  testWidgets('App starts without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const ShrinkeoApp());
    expect(find.text('Shrinkeo'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:shrinkeo/main.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App starts without crashing', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    
    await tester.pumpWidget(ShrinkeoApp(prefs: prefs));
    expect(find.text('Shrinkeo'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:catatanku/main.dart';

void main() {
  testWidgets('CatatanKu app initial smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CatatanKuApp());

    // Verify that the splash screen shows 'CatatanKu'
    expect(find.text('CatatanKu'), findsOneWidget);
  });
}

import 'package:bolehmakan/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('App should build without errors', (WidgetTester tester) async {
    // 🧪 Basic smoke test
    await tester.pumpWidget(
      const ProviderScope(
        child: BolehMakanApp(),
      ),
    );

    // ✅ Verify app title is displayed
    expect(find.text('BolehMakan'), findsOneWidget);
  });
}

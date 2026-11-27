import 'package:flutter_test/flutter_test.dart';
import 'package:product_catalog/main.dart';

void main() {
  testWidgets('Product catalog app loads successfully', (WidgetTester tester) async {
    // Build product catalog app and trigger a frame.
    await tester.pumpWidget(const ProductCatalogApp());

    // Advance time to resolve simulated async loading delay
    await tester.pumpAndSettle();

    // Verify that title text is displayed.
    expect(find.text('Discover Products'), findsOneWidget);
  });
}


import 'package:flutter_test/flutter_test.dart';
import 'package:product_catalog_app/main.dart';

void main() {
  testWidgets('Product list displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const ProductApp());

    expect(find.text('Product A'), findsOneWidget);
    expect(find.text('Product B'), findsOneWidget);
    expect(find.text('Product C'), findsOneWidget);

    await tester.tap(find.text('Product A'));
    await tester.pumpAndSettle();

    expect(find.text('Description of Product A'), findsOneWidget);
    expect(find.text('Price: \$29.99'), findsOneWidget);
  });
}

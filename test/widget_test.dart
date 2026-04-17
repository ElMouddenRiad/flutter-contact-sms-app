import 'package:flutter_test/flutter_test.dart';

import 'package:contact_sms_app/main.dart';

void main() {
  testWidgets('Auth screen renders expected UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Create Account'), findsOneWidget);
  });
}

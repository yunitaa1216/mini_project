import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:kos_project/view/login_page.dart';

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    final emailTextField = find.byType(TextField).at(0);
    final passwordTextField = find.byType(TextField).at(1);

    await tester.enterText(emailTextField, 'test@gmail.com');
    await tester.enterText(passwordTextField, 'password123');

    expect(find.text('test@gmail.com'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);

    await tester.pump();
  });
}
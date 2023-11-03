import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:kos_project/view/splash.dart';

void main() {
  testWidgets('WelcomeScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WelcomeScreen()));

    final welcomeText = find.text('Welcome');
    final loginButton = find.text('Login');

    expect(welcomeText, findsOneWidget);
    expect(loginButton, findsOneWidget);

    await tester.tap(loginButton);

    await tester.pump();
  });
}
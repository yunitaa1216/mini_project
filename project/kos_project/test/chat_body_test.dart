import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:kos_project/view/chat_body.dart';

void main() {
  testWidgets('ChatPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ChatPage()));

    final appBarTitle = find.text('Tanya-tanya tips menarik kos?');
    final inputTextField = find.byType(TextField);

    expect(appBarTitle, findsOneWidget);
    expect(inputTextField, findsOneWidget);

    await tester.enterText(inputTextField, 'Hello, chatbot!');
    await tester.pump();
  });
}
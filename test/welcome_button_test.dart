import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fess/views/widgets/welcome_button.dart';

void main() {
  final String text = 'Sample Text';
  void action() {
    return null;
  }

  final childWidget = WelcomeButton(text, action);

  testWidgets('Finds a specific instance', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: childWidget,
        ),
      ),
    );

    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
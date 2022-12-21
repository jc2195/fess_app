import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fess/views/widgets/login_prompt.dart';

void main() {

  final childWidget = LoginPrompt(null);

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
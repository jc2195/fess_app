import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fess/views/widgets/text_input.dart';

void main() {

  final childWidget = TextInput();

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
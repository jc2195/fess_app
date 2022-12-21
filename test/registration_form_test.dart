import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fess/views/widgets/registration_form.dart';

void main() {

  final childWidget = RegistrationForm(onSubmit: null, options: ['option1', 'option2'], uniInfo: {'domain': '@cam.ac.uk', 'prefix': 'abc123', 'name': 'Cambridge'});

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
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fess/views/widgets/background_slideshow.dart';

void main() {
  final List resources = [
    'assets/images/background_1.jpeg',
    'assets/images/background_2.jpeg',
    'assets/images/background_3.jpeg',
    'assets/images/background_4.jpeg',
    'assets/images/background_5.jpeg',
    'assets/images/background_6.jpeg',
    'assets/images/background_7.jpeg',
    'assets/images/background_8.jpeg',
    'assets/images/background_9.jpeg',
    'assets/images/background_10.jpeg',
  ];

  final childWidget = BackgroundSlideshow(resources);

  testWidgets('Finds a specific instance', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: childWidget,
        ),
      ),
    );

    await tester.pump(Duration(seconds: 20));
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}

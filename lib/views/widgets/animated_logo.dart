import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedTextKit(
        speed: Duration(seconds: 6),
        repeatForever: true,
        underscoreFlashes: 10,
        text: ["Fess"],
        textStyle: TextStyle(

          fontSize: 80.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          shadows: [
            Shadow(
              color: const Color(0x29000000),
              offset: Offset(6, 6),
              blurRadius: 18,
            ),
          ]
        ),
    );
  }
}
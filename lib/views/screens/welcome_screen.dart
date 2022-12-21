import 'package:fess/views/screens/institution_screen.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/background_slideshow.dart';
import '../widgets/welcome_button.dart';
import '../widgets/animated_logo.dart';
import '../widgets/login_prompt.dart';
import '../widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:fess/views/widgets/registration_form.dart';
import 'package:fess/views/widgets/login_form.dart';

class WelcomeScreen extends StatelessWidget{
  final Function register;
  final Function login;

  WelcomeScreen({this.register, this.login});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Container(
          child: AnimatedLogo(),
        ),
        Spacer(),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 21),
              child: WelcomeButton(
                'Register',
                  register,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 90),
              child: LoginPrompt(login),
            ),
          ],
        ),
      ],
    );
  }
}
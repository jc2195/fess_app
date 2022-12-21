import 'package:fess/views/screens/institution_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';

import '../widgets/background_slideshow.dart';
import '../widgets/welcome_button.dart';
import '../widgets/animated_logo.dart';
import '../widgets/login_prompt.dart';
import '../widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:fess/views/widgets/registration_form.dart';
import 'package:fess/views/widgets/login_form.dart';

class RegistrationScreen extends StatelessWidget{
  final List colleges;
  final Map uniInfo;
  final Function onSubmit;
  final Function onBack;

  RegistrationScreen({this.colleges, this.onSubmit, this.onBack, this.uniInfo});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      resizeDuration: Duration(milliseconds: 1),
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) => onBack(),
      child: Stack(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: onBack,
                iconSize: 30,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: RegistrationForm(options: colleges, onSubmit: onSubmit, uniInfo: uniInfo),
              ),
              KeyboardAware(
                builder: (context, keyboard) {
                  return Container(
                    height: keyboard.isKeyboardOpen ? 170 : 0,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
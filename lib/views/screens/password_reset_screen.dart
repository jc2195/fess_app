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
import 'package:fess/views/widgets/password_reset_form.dart';

class PasswordResetScreen extends StatelessWidget {
  final Function onSubmit;
  final Function onBack;
  final List<String> domains;

  PasswordResetScreen({this.onSubmit, this.onBack, this.domains});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Container(
                width: 214,
                margin: EdgeInsets.only(bottom: 11, top: 49),
                child: Text(
                  'It happens...',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: 214,
                margin: EdgeInsets.only(bottom: 81),
                child: Text(
                  'Type in your email and we\'ll send you info about how to reset your password.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: PasswordResetForm(onSubmit: onSubmit, domains: domains),
              ),
              KeyboardAware(
                builder: (context, keyboard) {
                  return Container(
                    height: keyboard.isKeyboardOpen ? 0 : 51,
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
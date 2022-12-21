import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fess/views/widgets/login_button.dart';

class LoginPrompt extends StatelessWidget{
  final Function onClick;

  LoginPrompt(this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LoginButton(
              'Log In',
              onClick,
            ),
          ),
        ],
      ),
    );
  }
}
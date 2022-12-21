import 'package:fess/views/screens/institution_screen.dart';
import 'package:fess/views/widgets/login_button.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/background_slideshow.dart';
import '../widgets/welcome_button.dart';
import '../widgets/animated_logo.dart';
import '../widgets/login_prompt.dart';
import '../widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:fess/views/widgets/registration_form.dart';
import 'package:fess/views/widgets/login_form.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerificationScreen extends StatelessWidget{
  final Function onResend;
  final Function onVerified;

  VerificationScreen({this.onResend, this.onVerified});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Container(
          child: AnimatedLogo(),
        ),
        Column(
          children: [
            Container(
              width: 214,
              margin: EdgeInsets.only(bottom: 11, top: 49),
              child: Text(
                'Verify your email!',
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
                'To finish setting up your account, please click the confirmation link that was sent to your university email address.',
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
              margin: EdgeInsets.only(bottom: 21),
              child: WelcomeButton(
                "I've verified",
                onVerified,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 90),
              child: LoginButton(
                "Resend email",
                (){
                  onResend();
                  Fluttertoast.showToast(
                      msg: "Verification email sent!",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 5,
                      backgroundColor: const Color(0x7b000000),
                      textColor: Colors.white,
                      fontSize: 18,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

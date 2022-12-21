import 'package:fess/services/secure_storage.dart';
import 'package:fess/views/screens/welcome_screen.dart';
import 'package:fess/views/widgets/welcome_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fess/services/firebase_auth.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 50,
        child: WelcomeButton(
          'Log Out',
          () async {
            await SecureStorage().removeCredentials();
            await FirebaseAuthentication().logoutUser();
            Phoenix.rebirth(context);
          },
        ),
      ),
    );
  }
}
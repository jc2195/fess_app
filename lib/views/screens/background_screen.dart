import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fess/views/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

import '../widgets/background_slideshow.dart';
import '../widgets/welcome_button.dart';
import '../widgets/animated_logo.dart';
import '../widgets/login_prompt.dart';
import '../widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:fess/views/widgets/registration_form.dart';
import 'package:fess/views/widgets/login_form.dart';
import 'package:fess/models/welcome_model.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:keyboard_utils/keyboard_utils.dart';
import 'package:animations/animations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class BackgroundScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            BackgroundSlideshow([
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
            ]),
            ChangeNotifierProvider(
              create: (context) =>
                  WelcomeModel(),
              child: Consumer<WelcomeModel>(
                builder: (context, wel, child) => Align(
                  alignment: Alignment.bottomCenter,
                  child: PageTransitionSwitcher(
                    reverse: wel.isGoingBack,
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return SharedAxisTransition(
                        fillColor: Colors.transparent,
                        child: child,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                      );
                    },
                    child: wel.widgetHistory[wel.activeScreen],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

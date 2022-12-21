import 'package:fess/views/widgets/notifier_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';
import 'package:provider/provider.dart';
import 'package:fess/models/login_model.dart';
import 'package:fess/views/widgets/text_input.dart';
import 'package:fess/views/widgets/dropdown_input.dart';
import 'custom_checkbox.dart';
import 'package:flutter/foundation.dart';
import 'package:fess/models/password_reset_model.dart';

import 'text_input.dart';
import 'welcome_button.dart';

class PasswordResetForm extends StatelessWidget{

  final Function onSubmit;
  final List<String> domains;

  PasswordResetForm({this.onSubmit, this.domains});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PasswordResetModel(domains: domains),
      child: Consumer<PasswordResetModel>(
        builder: (context, res, child) => KeyboardAware(
          builder: (context, keyboard) {
            return Form(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextInput(
                      labelText: 'Your university email',
                      hintText: 'abc123@uni.ac.uk',
                      isEmail: true,
                      isError: !res.validEmail,
                      errorText: res.emailError,
                      onChanged: (value){
                        res.email = value;
                      },
                    ),
                  ),
                  Container(
                    height: keyboard.isKeyboardOpen ? 20 : 117,
                  ),
                  Container(
                    child: WelcomeButton(
                      'Submit',
                          () {
                        if (res.validateForm()) {
                          onSubmit(email: res.email);
                        }
                      },
                    ),
                  ),
                  Container(
                    height: keyboard.isKeyboardOpen ? 10 : 30,
                  ),
                  Container(
                    height: keyboard.isKeyboardOpen ? 300 : 0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
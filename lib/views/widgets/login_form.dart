import 'package:fess/services/secure_storage.dart';
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

import 'text_input.dart';
import 'welcome_button.dart';

class LoginForm extends StatelessWidget{

  final Function onSubmit;
  final Function onForgot;
  final List<String> domains;

  LoginForm({this.onSubmit, this.domains, this.onForgot});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginModel(domains: domains),
      child: Consumer<LoginModel>(
        builder: (context, log, child) => KeyboardAware(
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
                      isError: !log.validEmail,
                      errorText: log.emailError,
                      onChanged: (value){
                        log.email = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextInput(
                      labelText: 'Password',
                      hintText: 'At least 8 characters',
                      isPassword: true,
                      isError: !log.validPassword,
                      errorText: log.passwordError,
                      onChanged: (value){
                        log.password = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomCheckbox(
                            checked: log.remember,
                            onPressed: (){
                              log.toggleRemember();
                            }
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            'Keep me signed in',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: keyboard.isKeyboardOpen ? 20 : 117,
                  ),
                  Container(
                    child: WelcomeButton(
                      'Log In',
                          () {
                        if (log.validateForm()) {
                          onSubmit(email: log.email, password: log.password, context: context, remember: log.remember);
                        }
                      },
                    ),
                  ),
                  Container(
                    height: keyboard.isKeyboardOpen ? 10 : 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 42, right: 42),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FlatButton(
                        onPressed: onForgot,
                        child: Text(
                          'I forgot my password…',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
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
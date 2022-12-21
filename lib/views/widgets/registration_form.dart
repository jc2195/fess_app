import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fess/models/registration_model.dart';
import 'package:fess/views/widgets/text_input.dart';
import 'package:fess/views/widgets/dropdown_input.dart';

import 'text_input.dart';
import 'welcome_button.dart';

class RegistrationForm extends StatelessWidget{

  final Function onSubmit;
  final Map uniInfo;
  final List<String> options;

  RegistrationForm({this.onSubmit, this.options, this.uniInfo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistrationModel(emailDomain: uniInfo['domain']),
      child: Consumer<RegistrationModel>(
        builder: (context, reg, child) => Form(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextInput(
                  labelText: 'Your ${uniInfo['domain']} email',
                  hintText: '${uniInfo['prefix']}${uniInfo['domain']}',
                  isEmail: true,
                  isError: !reg.validEmail,
                  errorText: reg.emailError,
                  onChanged: (value){
                    reg.email = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextInput(
                  labelText: 'Password',
                  hintText: 'At least 8 characters',
                  isPassword: true,
                  isError: !reg.validPassword,
                  errorText: reg.passwordError,
                  onChanged: (value){
                    reg.password = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextInput(
                  labelText: 'Confirm password',
                  hintText: 'Just to make sure',
                  isPassword: true,
                  isError: !reg.validPasswordConfirmation,
                  errorText: reg.passwordConfirmationError,
                  onChanged: (value){
                    reg.passwordConfirmation = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: DropdownInput(
                  onChanged: (value){
                    reg.college = value;
                  },
                  isError: !reg.validCollege,
                  errorText: reg.collegeError,
                  hintText: 'Choose wisely*',
                  labelText: 'College',
                  options: options,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: WelcomeButton(
                  'Register',
                  () {
                    if (reg.validateForm()) {
                      onSubmit(email: reg.email, password: reg.password, college: reg.college, university: uniInfo['name']);
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 42, right: 42),
                child: Text(
                  '*Your college is permanent and cannot be changed after registration',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
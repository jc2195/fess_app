import 'package:flutter/material.dart';

class RegistrationModel extends ChangeNotifier {
  final String emailDomain;

  String email = '';
  String password = '';
  String passwordConfirmation = '';
  String college = '';

  bool validEmail = true;
  bool validPassword = true;
  bool validPasswordConfirmation = true;
  bool validCollege = true;

  String emailError = '';
  String passwordError = '';
  String passwordConfirmationError = '';
  String collegeError = '';

  RegistrationModel({this.emailDomain});

  void validateEmail() {
    RegExp emailExp = RegExp("[A-Za-z0-9._%+-]+${emailDomain.replaceAll('.', '\\.')}");
    if (email.isEmpty) {
      validEmail = false;
      emailError = 'Your $emailDomain email';
    } else if (emailExp.hasMatch(email)) {
        validEmail = true;
        email = email.toLowerCase();
        emailError = '';
    } else {
        validEmail = false;
        emailError = 'Needs to be your $emailDomain email';
    }
  }

  void validatePassword() {
    if (password.length >= 8) {
      validPassword = true;
      passwordError = '';
    } else {
      validPassword = false;
      passwordError = 'Password (min 8 characters)';
    }
  }

  void validatePasswordConfirmation() {
    if (passwordConfirmation.isEmpty) {
    validPasswordConfirmation = false;
    passwordConfirmationError = 'Confirm password';
    } else if (password == passwordConfirmation) {
      validPasswordConfirmation = true;
      passwordConfirmationError = '';
    } else {
      validPasswordConfirmation = false;
      passwordConfirmationError = 'Passwords must match';
    }
  }

  void validateCollege() {
    if (college.isEmpty) {
      validCollege = false;
      collegeError = 'Please pick your college';
    } else {
      validCollege = true;
      collegeError = '';
    }
  }

  bool validateForm() {
    validateEmail();
    validatePassword();
    validatePasswordConfirmation();
    validateCollege();
    if (validEmail && validPassword && validPasswordConfirmation && validCollege) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}
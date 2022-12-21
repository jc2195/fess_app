import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginModel extends ChangeNotifier {
  final List<String> domains;

  String email = '';
  String password = '';

  bool validEmail = true;
  bool validPassword = true;
  bool remember = true;

  String emailError = '';
  String passwordError = '';

  LoginModel({this.domains});

  // String transformCRSid(email) {
  //   return email + '@cam.ac.uk';
  // }

  void toggleRemember() {
    remember = remember ? false : true;
    notifyListeners();
  }

  void validateEmail() {
    List<RegExp> expList = [
      for (var i in domains) RegExp("[A-Za-z0-9._%+-]+${i.replaceAll('.', '\\.')}")
    ];
    if (email.isEmpty) {
      validEmail = false;
      emailError = 'Your university email';
    } else if (email.contains('@')) {
      if (expList.any((element) => element.hasMatch(email))) {
        validEmail = true;
        email = email.toLowerCase();
        emailError = '';
      } else {
        validEmail = false;
        emailError = 'Needs to be your university email';
      }
    }
  }

  void validatePassword() {
    if (password.isEmpty) {
      validPassword = false;
      passwordError = 'Please enter your password';
    } else {
      validPassword = true;
      passwordError = '';
    }
  }

  bool validateForm() {
    validateEmail();
    validatePassword();
    if (validEmail && validPassword) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}
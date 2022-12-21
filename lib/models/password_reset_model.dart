import 'package:flutter/material.dart';

class PasswordResetModel extends ChangeNotifier {
  final List<String> domains;

  String email = '';
  bool validEmail = true;
  String emailError = '';

  PasswordResetModel({this.domains});

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

  bool validateForm() {
    validateEmail();
    if (validEmail) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}
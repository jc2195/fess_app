import 'package:flutter/material.dart';

class InstitutionModel extends ChangeNotifier {
  String institution = '';

  bool validInstitution = true;

  String institutionError = '';

  void validateInstitution() {
    if (institution.isEmpty) {
      validInstitution = false;
      institutionError = 'Please pick your university';
    } else {
      validInstitution = true;
      institutionError = '';
    }
  }

  bool validateForm() {
    validateInstitution();
    if (validInstitution) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}
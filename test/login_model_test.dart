import 'package:fess/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email validation works correctly', () {
    final model = LoginModel(domains: ['@cam.ac.uk', '@ox.ac.uk']);
    test('Correct values for blank email', () {

      model.email = '';
      model.validateEmail();

      expect(model.validEmail, false);
      expect(model.emailError, 'Your university email');
    });
    test('Correct values for foreign email', () {

      model.email = 'someemail@email.com';
      model.validateEmail();

      expect(model.validEmail, false);
      expect(model.emailError, 'Needs to be your university email');
    });
    test('Correct values for good email', () {

      model.email = 'abc123@cam.ac.uk';
      model.validateEmail();

      expect(model.validEmail, true);
      expect(model.emailError, '');
    });
  });
  group('Password validation works correctly', () {
    final model = LoginModel(domains: ['@cam.ac.uk', '@ox.ac.uk']);
    test('Correct values for blank password', () {

      model.password = '';
      model.validatePassword();

      expect(model.validPassword, false);
      expect(model.passwordError, 'Please enter your password');
    });
    test('Correct values for correct password', () {

      model.password = '123456789';
      model.validatePassword();

      expect(model.validPassword, true);
      expect(model.passwordError, '');
    });
  });
  group('Form validation function works correctly', () {
    final model = LoginModel(domains: ['@cam.ac.uk', '@ox.ac.uk']);
    test('Correct values for all false values', () {

      model.password = '';
      model.email = '';

      expect(model.validateForm(), false);
    });
    test('Correct values for partially false values', () {

      model.password = '';
      model.email = 'abc123';

      expect(model.validateForm(), false);
    });
    test('Correct values for all true values', () {

      model.password = '12345678';
      model.email = 'abc123@cam.ac.uk';

      expect(model.validateForm(), true);
    });
  });
}
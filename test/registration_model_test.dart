import 'package:fess/models/registration_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email validation works correctly', () {
    final model = RegistrationModel(emailDomain: '@cam.ac.uk');
    test('Correct values for blank email', () {

      model.email = '';
      model.validateEmail();

      expect(model.validEmail, false);
      expect(model.emailError, 'Your @cam.ac.uk email');
    });
    test('Correct values for foreign email', () {

      model.email = 'someemail@email.com';
      model.validateEmail();

      expect(model.validEmail, false);
      expect(model.emailError, 'Needs to be your @cam.ac.uk email');
    });
    test('Correct values for bad CRSid', () {

      model.email = 'asdfasfsadf';
      model.validateEmail();

      expect(model.validEmail, false);
      expect(model.emailError, 'Needs to be your @cam.ac.uk email');
    });
    test('Correct values for good email', () {

      model.email = 'abc123@cam.ac.uk';
      model.validateEmail();

      expect(model.validEmail, true);
      expect(model.emailError, '');
    });
    test('Correct values for good CRSid', () {

      model.email = 'abc123@cam.ac.uk';
      model.validateEmail();

      expect(model.validEmail, true);
      expect(model.emailError, '');
      expect(model.email, 'abc123@cam.ac.uk');
    });
  });
  group('Password validation works correctly', () {
    final model = RegistrationModel(emailDomain: '@cam.ac.uk');
    test('Correct values for blank password', () {

      model.password = '';
      model.validatePassword();

      expect(model.validPassword, false);
      expect(model.passwordError, 'Password (min 8 characters)');
    });
    test('Correct values for blank password confirmation', () {

      model.passwordConfirmation = '';
      model.validatePasswordConfirmation();

      expect(model.validPasswordConfirmation, false);
      expect(model.passwordConfirmationError, 'Confirm password');
    });
    test('Correct values for short password', () {

      model.password = '12345';
      model.validatePassword();

      expect(model.validPassword, false);
      expect(model.passwordError, 'Password (min 8 characters)');
    });
    test('Correct values for correct password', () {

      model.password = '123456789';
      model.validatePassword();

      expect(model.validPassword, true);
      expect(model.passwordError, '');
    });
    test('Correct values for unmatched passwords', () {

      model.password = 'abcdefghij';
      model.passwordConfirmation = 'abcdefghi';
      model.validatePassword();
      model.validatePasswordConfirmation();

      expect(model.validPassword, true);
      expect(model.validPasswordConfirmation, false);
      expect(model.passwordError, '');
      expect(model.passwordConfirmationError, 'Passwords must match');
    });
    test('Correct values for matched passwords', () {

      model.password = 'abcdefghij';
      model.passwordConfirmation = 'abcdefghij';
      model.validatePassword();
      model.validatePasswordConfirmation();

      expect(model.validPassword, true);
      expect(model.validPasswordConfirmation, true);
      expect(model.passwordError, '');
      expect(model.passwordConfirmationError, '');
    });
  });
  group('College validation works correctly', () {
    final model = RegistrationModel(emailDomain: '@cam.ac.uk');
    test('Correct values for blank college', () {

      model.college = '';
      model.validateCollege();

      expect(model.validCollege, false);
      expect(model.collegeError, 'Please pick your college');
    });
    test('Correct values for selected college', () {

      model.college = 'Fitzwilliam';
      model.validateCollege();

      expect(model.validCollege, true);
      expect(model.collegeError, '');
    });
  });
  group('Form validation function works correctly', () {
    final model = RegistrationModel(emailDomain: '@cam.ac.uk');
    test('Correct values for all false values', () {

      model.college = '';
      model.password = '';
      model.passwordConfirmation = '';
      model.email = '';

      expect(model.validateForm(), false);
    });
    test('Correct values for partially false values', () {

      model.college = 'Fitzwilliam';
      model.password = '';
      model.passwordConfirmation = '';
      model.email = 'abc123';

      expect(model.validateForm(), false);
    });
    test('Correct values for all true values', () {

      model.college = 'Fitzwilliam';
      model.password = '12345678';
      model.passwordConfirmation = '12345678';
      model.email = 'abc123@cam.ac.uk';

      expect(model.validateForm(), true);
    });
  });
}
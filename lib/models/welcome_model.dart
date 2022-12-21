import 'package:fess/models/global_model.dart';
import 'package:fess/services/firebase_auth.dart';
import 'package:fess/services/secure_storage.dart';
import 'package:fess/views/screens/institution_screen.dart';
import 'package:fess/views/screens/registration_screen.dart';
import 'package:fess/views/screens/verification_screen.dart';
import 'package:fess/views/widgets/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:fess/views/screens/welcome_screen.dart';
import 'package:fess/views/screens/login_screen.dart';
import 'package:fess/views/screens/home_screen.dart';
import 'package:fess/views/widgets/notifier_widget.dart';
import 'package:fess/views/screens/password_reset_screen.dart';
import 'package:fess/services/firestore.dart';
import 'package:provider/provider.dart';

class WelcomeModel extends ChangeNotifier {
  int activeScreen;
  bool isGoingBack = false;
  List<Widget> widgetHistory = [];
  List institutionData;

  WelcomeModel() {
    widgetHistory.add(
      WelcomeScreen(
        register: this.setInstitution,
        login: this.setLogin,
      ),
    );
    this.activeScreen = 0;
  }

  VoidCallback setWelcome({register, login}) {
    widgetHistory.add(
      WelcomeScreen(
        register: register,
        login: login,
      ),
    );
    activeScreen += 1;
    isGoingBack = false;
    notifyListeners();
    return null;
  }

  Future<VoidCallback> setInstitution() async {
    institutionData = institutionData == null ? await Firestore().getInstitutions() : institutionData;
    widgetHistory.add(
      InstitutionScreen(
          options: filterInstitutions(),
          onSubmit: this.setRegistration,
          onBack: this.goBack),
    );
    activeScreen += 1;
    isGoingBack = false;
    notifyListeners();
    return null;
  }

  VoidCallback setRegistration(selectedInstitution) {
    List<String> colleges = getCollegesFromUni(selectedInstitution);
    widgetHistory.add(
      RegistrationScreen(
        colleges: colleges,
        onSubmit: this.setVerification,
        onBack: this.goBack,
        uniInfo: this.getSpecificEmailProperties(selectedInstitution),
      ),
    );
    activeScreen += 1;
    isGoingBack = false;
    notifyListeners();
    return null;
  }

  Future<VoidCallback> setLogin() async {
    institutionData = institutionData == null ? await Firestore().getInstitutions() : institutionData;
    widgetHistory.add(
      LoginScreen(
        onSubmit: this.setHome,
        onBack: this.goBack,
        domains: getAllEmailDomains(),
        onForgot: this.setPasswordReset,
      ),
    );
    activeScreen += 1;
    isGoingBack = false;
    notifyListeners();
    return null;
  }

  Future<VoidCallback> setPasswordReset() {
    widgetHistory.add(
      PasswordResetScreen(
        onSubmit: FirebaseAuthentication().sendPasswordReset,
        onBack: this.goBack,
        domains: getAllEmailDomains(),
      ),
    );
    activeScreen += 1;
    isGoingBack = false;
    notifyListeners();
    return null;
  }

  Future<VoidCallback> setVerification(
      {email, password, college, university}) async {
    var user = await FirebaseAuthentication().registrationSequence(
        email: email,
        password: password,
        university: university,
        college: college);
    if (user != null) {
      widgetHistory.add(
        VerificationScreen(
            onVerified: this.setLogin, onResend: this.sendVerificationEmail),
      );
      activeScreen += 1;
      isGoingBack = false;
      notifyListeners();
    }
    return null;
  }

  VoidCallback sendVerificationEmail() {
    FirebaseAuthentication().sendVerification();
    return null;
  }

  VoidCallback needToVerify() {
    widgetHistory.add(
      VerificationScreen(
          onVerified: this.setLogin, onResend: this.sendVerificationEmail),
    );
    activeScreen += 1;
    isGoingBack = false;
    notifyListeners();
    return null;
  }

  Future<VoidCallback> setHome({email, password, context, remember}) async {
    var user = await FirebaseAuthentication()
        .loginUser(email: email, password: password);
    if (user != null) {
      bool verificationStatus = FirebaseAuthentication().checkVerification();
      if (verificationStatus) {
        final userData = await Firestore().getUserUniversityAndCollege();
        if (remember) {
          SecureStorage().setCredentials(email: email, password: password, remember: remember);
        }
        Navigator.pushReplacement(
            context, MaterialPageRoute(
              builder: (context) {
                return ChangeNotifierProvider(
                  create: (context) => GlobalModel(
                    university: userData['university'],
                    college: userData['college'],
                  ),
                  child: HomeScreen(),
                );
              }
        )
        );
      } else {
        this.needToVerify();
      }
    }
    return null;
  }

  VoidCallback goBack() {
    activeScreen -= 1;
    widgetHistory.removeLast();
    isGoingBack = true;
    notifyListeners();
    return null;
  }

  List filterInstitutions() {
    return <String>[
      for (int i = 0; i < institutionData.length; i++)
        institutionData[i]['name']
    ];
  }

  List<String> getCollegesFromUni(institution) {
    var selectedUni =
        institutionData.firstWhere((element) => institution == element['name']);
    return selectedUni['colleges'].cast<String>();
  }

  Map<String, String> getSpecificEmailProperties(institution) {
    var selectedUni =
        institutionData.firstWhere((element) => institution == element['name']);
    return {
      'prefix': selectedUni['email_prefix'],
      'domain': selectedUni['email_domain'],
      'name': selectedUni['name']
    };
  }

  List<String> getAllEmailDomains() {
    return [for (var i in institutionData) i['email_domain']];
  }
}

import 'package:fess/services/firebase_auth.dart';
import 'package:fess/services/firestore.dart';
import 'package:fess/services/secure_storage.dart';

class Initialise {
  Future startup() async {
    await Firestore().firebaseInit();
    final bool autoLogin = await getStoredLoginData();
    final userData = autoLogin ? await fetchStartupUserData() : null;
    return {'autoLogin': autoLogin, 'userData': userData};
  }

  Future<bool> getStoredLoginData() async {
    final userCredentials = await SecureStorage().getCredentials();
    if (userCredentials['remember'] == null || userCredentials['email'] == null || userCredentials['password'] == null) {
      return false;
    } else if (userCredentials['remember'] == 'true') {
      await FirebaseAuthentication().loginUser(email: userCredentials['email'], password: userCredentials['password']);
      return true;
    } else {
      return false;
    }
  }

  Future fetchStartupUserData() async {
    final data = await Firestore().getUserUniversityAndCollege();
    return data;
  }
}
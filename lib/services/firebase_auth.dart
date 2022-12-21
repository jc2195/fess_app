import 'package:firebase_auth/firebase_auth.dart';
import 'package:fess/services/firestore.dart';
import 'package:fess/views/widgets/notifier_widget.dart';

class FirebaseAuthentication {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future registerNewUser({email, password}) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return user;
    } catch (e) {
      if (e.code == 'email-already-in-use') {
        NotifierWidget(message: 'An account with that email already exists!');
      } else if (e.code == 'network-request-failed') {
        NotifierWidget(message: "Can't connect to the internet!");
      }
    }
  }

  Future loginUser({email, password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      if (e.code == 'user-not-found') {
        NotifierWidget(message: 'No account found for that email!');
      } else if (e.code == 'wrong-password') {
        NotifierWidget(message: 'The password you entered is incorrect!');
      } else if (e.code == 'network-request-failed') {
        NotifierWidget(message: "Can't connect to the internet!");
      }
    }
  }

  Future logoutUser() async {
    await auth.signOut();
  }

  Future sendPasswordReset({email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email)
          .then((value) => NotifierWidget(message: 'Reset instructions have been sent to your email!'))
          .then((value) => 'Success');
    } catch (e) {
      if (e.code == 'user-not-found') {
        NotifierWidget(message: 'No account found for that email!');
      } else if (e.code == 'network-request-failed') {
        NotifierWidget(message: "Can't connect to the internet!");
      }
    }
  }

  bool checkVerification() {
    User user = FirebaseAuth.instance.currentUser;
    return user.emailVerified;
  }

  sendVerification() async {
    User user = FirebaseAuth.instance.currentUser;
    await user.sendEmailVerification();
  }

  registrationSequence({email, password, university, college}) async {
    try {
      final newUser = await this.registerNewUser(email: email, password: password);
      if (newUser != null) {
        String userId = newUser.user.uid;
        await newUser.user.sendEmailVerification();
        await Firestore().addNewUser(id: userId, college: college, university: university);
      }
      return newUser;
    }
    catch(e) {
      if (e.code == 'network-request-failed') {
        NotifierWidget(message: "Can't connect to the internet!");
      }
    }
  }
}
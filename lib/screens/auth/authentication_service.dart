import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plantgo_alpha/models/auth_result_status.dart';
import 'package:plantgo_alpha/models/auth_exceptions_handler.dart';

class AuthenticationService with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  //AuthResultStatus _status;
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  String userUid;
  String get getUserUid => userUid;

  Stream<User> get authStateChanges => firebaseAuth.idTokenChanges();

  Future<String> logIntoAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _loggedIn = true;
      User user = userCredential.user;
      userUid = user.uid;
      print(userUid);
      notifyListeners();

      return "Signed In";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return "Wrong password provided for that user.";
      } else {
        return 'Something Went Wrong.';
      }
    }
  }

  Future createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User user = userCredential.user;
      userUid = user.uid;
      print('Created account Uid => $userUid');
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future logOutViaEmail() {
    return firebaseAuth.signOut();
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final UserCredential userCredential =
        await firebaseAuth.signInWithCredential(authCredential);
    final User user = userCredential.user;
    assert(user.uid != null);

    userUid = user.uid;
    print('Google User Uid => $userUid');
    notifyListeners();
  }

  Future signOutWithGoogle() async {
    return googleSignIn.signOut();
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
      _loggedIn = false;
      print("User Sign Out");
      notifyListeners();
    } catch (e, st) {
      FlutterError.reportError(FlutterErrorDetails(exception: e, stack: st));
    }
  }
}

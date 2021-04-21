import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  String userUid;
  String get getUserUid => userUid;

  Future logIntoAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _loggedIn = true;
      User user = userCredential.user;
      userUid = user.uid;
      print(userUid);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      return e.message;
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
      notifyListeners();
    } catch (e, st) {
      FlutterError.reportError(FlutterErrorDetails(exception: e, stack: st));
    }
  }

  Future<User> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }
}

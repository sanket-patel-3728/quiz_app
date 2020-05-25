import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/models/models.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFrommFirebaseUser(FirebaseUser user) {
    return user != null ? User(uId: user.uid) : null;
  }

  Future signInEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser fireBaseUser = authResult.user;
      return _userFrommFirebaseUser(fireBaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFrommFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

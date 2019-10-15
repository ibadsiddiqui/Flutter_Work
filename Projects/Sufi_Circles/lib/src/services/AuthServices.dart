import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn(String email, String password) async {
    try {
      return (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      throw e;
    }
  }

  Future<FirebaseUser> createUser(String email, String password) async {
    print("here");
    try {
      return (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      throw e;
    }
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn(Map<String, String> authDetails) async {
    try {
      return (await _firebaseAuth.signInWithEmailAndPassword(
              email: authDetails["email"], password: authDetails["password"]))
          .user;
    } catch (e) {
      throw e;
    }
  }

  Future<FirebaseUser> createUser(Map<String, String> authDetails) async {
    print("here");
    try {
      return (await _firebaseAuth.createUserWithEmailAndPassword(
              email: authDetails["email"], password: authDetails["password"]))
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

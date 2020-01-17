import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventServices {
  CollectionReference userDB = Firestore.instance.collection("events");

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> userSignIn(Map<String, String> authDetails) async {
    try {
      return (await _firebaseAuth.signInWithEmailAndPassword(
              email: authDetails["email"], password: authDetails["password"]))
          .user;
    } catch (e) {
      throw e;
    }
  }

  Future<FirebaseUser> createUser(Map<String, String> authDetails) async {
    try {
      return (await _firebaseAuth.createUserWithEmailAndPassword(
              email: authDetails["email"], password: authDetails["password"]))
          .user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOutUser() async {
    try {
      return (await _firebaseAuth.signOut());
    } catch (e) {
      print(e);
    }
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  Future<void> updateFirebaseUserEmail(String email) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    await user.updateEmail(email);
  }

  Future<void> signOut() async {
    try {
      return _firebaseAuth.signOut();
    } catch (e) {
      print(e);
    }
  }
}

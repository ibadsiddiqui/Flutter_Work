import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDBServices {
  CollectionReference userDB = Firestore.instance.collection("user");
  Future<void> createUserInDB(Map<String, dynamic> user) async {
    try {
      return (await userDB.document(user["uid"]).setData(user));
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUserLastLogin(Map<String, dynamic> user) async {
    try {
      return (await userDB
          .document(user["uid"])
          .updateData({"lastSignInTime": user["lastSignInTime"]}));
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> getUserDetailsUsingID(String userID) async {
    try {
      return (await userDB.document(userID).get()).data;
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUserName(String uid, String name) async {
    try {
      return (await userDB.document(uid).updateData({"name": name}));
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUserEmail(String uid, String email) async {
    try {
      return (await userDB.document(uid).updateData({"email": email}));
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUserCountry(String uid, String country) async {
    try {
      return (await userDB.document(uid).updateData({"country": country}));
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUserCity(String uid, String city) async {
    try {
      return (await userDB.document(uid).updateData({"city": city}));
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUserProfilePicture(String uid, String url) async {
    try {
      return (await userDB.document(uid).updateData({"profile_picture": url}));
    } catch (e) {
      throw e;
    }
  }
}

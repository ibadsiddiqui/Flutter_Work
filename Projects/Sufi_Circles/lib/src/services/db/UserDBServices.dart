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
}

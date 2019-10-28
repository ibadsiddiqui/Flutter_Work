import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  CollectionReference userDB = Firestore.instance.collection("user");

  Future<void> createUserInDB(Map<String, dynamic> user) async {
    try {
      return (await userDB.document(user["uid"]).setData(user));
    } catch (e) {
      throw e;
    }
  }
}

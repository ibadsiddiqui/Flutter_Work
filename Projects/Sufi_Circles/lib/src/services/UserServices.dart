import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  Map<String, String> user = Map();
  CollectionReference userDB = Firestore.instance.collection("user");

  Future<void> createUserInDB(Map<String, dynamic> user) async {
    try {
      return (await userDB.document(user["uid"]).setData(user));
    } catch (e) {
      print("error");
      print(e);
    }
  }
}

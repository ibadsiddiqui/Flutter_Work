import 'dart:async';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  CollectionReference userDB = Firestore.instance.collection("user");

  Map<String, UserModel> user;
  UserServices() {
    print(user);
  }
}

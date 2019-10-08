import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/models/Category.dart';
// import 'package:ecommerce_flutter/models/Category.dart';
// import 'package:ecommerce_flutter/models/Product.dart';

class DbAPI {
  Stream<QuerySnapshot> getCategories() {
    Firestore db = Firestore.instance;
    try {
      Stream<QuerySnapshot> querySnapshot =
          db.collection('Categories').snapshots();
      return querySnapshot;
    } catch (e) {
      throw e;
    }
  }

  Stream<QuerySnapshot> getProducts(Category category) {
    Firestore db = Firestore.instance;
    try {
      Stream<QuerySnapshot> querySnapshot =
          db.collection('Categories').document(category.id).collection("parts") as Stream<QuerySnapshot>;
      return querySnapshot;
    } catch (e) {
      throw e;
    }
  }
}

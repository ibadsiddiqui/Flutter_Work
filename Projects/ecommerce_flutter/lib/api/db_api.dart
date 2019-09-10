import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/models/Category.dart';
import 'package:ecommerce_flutter/models/Product.dart';

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

  Stream<QuerySnapshot> getProducts() {
    Firestore db = Firestore.instance;
    try {
      return Stream<QuerySnapshot> db.collection('Products').snapshots();
      // return querySnapshot;
    } catch (e) {
      throw e;
    }
  }

  // List<Product> getProducts(Category category) {
  //   List<Product> tempList = [
  //     Product.create("product"),
  //     Product.create("product"),
  //     Product.create("product"),
  //     Product.create("product")
  //   ];
  //   return tempList;
  // }
}

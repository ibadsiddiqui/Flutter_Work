import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/api/db_api.dart';
import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/models/Category.dart';
import 'package:ecommerce_flutter/models/Product.dart';

class ProductsBloc implements BlocBase {
  List<Product> _products = List();

  StreamController<List<Product>> _productsController =
      StreamController<List<Product>>();
  Sink<List<Product>> get _intProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  ProductsBloc(Category category) {
    getProducts(category);
  }

  @override
  void dispose() {
    _productsController.close();
  }

  void getProducts(Category category) {
    DbAPI dbAPI = DbAPI();
    dbAPI.getProducts(category).listen((snapshot) {
      List<Product> tempProducts = List();
      for (DocumentSnapshot doc in snapshot.documents) {
        Product product = Product.fromFirestore(doc.data);
        product.id = doc.documentID;
        tempProducts.add(product);
      }
      _products.clear();
      _products.addAll(tempProducts);
      _intProducts.add(_products);
    });
  }
}

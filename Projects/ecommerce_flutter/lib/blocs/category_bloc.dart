import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/api/db_api.dart';
import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/models/Category.dart';

class CategoriesBloc implements BlocBase {
  List<Category> _categoryList = List();

  CategoriesBloc() {
    getCategories();
  }

  StreamController<List<Category>> _categoriesController =
      StreamController<List<Category>>();

  Sink<List<Category>> get _intCategories => _categoriesController.sink;
  Stream<List<Category>> get outCategories => _categoriesController.stream;

  @override
  void dispose() {
    _categoriesController.close();
  }

  void getCategories() {
    DbAPI dbAPI = DbAPI();
    dbAPI.getCategories().listen((snapshot) {
      List<Category> tempCategory = List();
      for (DocumentSnapshot doc in snapshot.documents) {
        Category category = Category.fromFirebase(doc.data);
        category.id = doc.documentID;
        tempCategory.add(category);
      }
      if (_categoryList.isEmpty)
        addCategory(tempCategory);
      else {
        _categoryList.clear();
        addCategory(tempCategory);
      }
    });
  }

  void addCategory(tempCat) {
    _categoryList.addAll(tempCat);
    _intCategories.add(_categoryList);
  }
}

import 'dart:async';

import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/models/Category.dart';

class CategoriesBloc implements BlocBase {
  List<Category> categoryList;

  StreamController<List<Category>> _categoriesController =
      StreamController<List<Category>>();

  Sink<List<Category>> get _intCategories => _categoriesController.sink;
  Stream<List<Category>> get outCategories => _categoriesController.stream;

  @override
  void dispose() {
    _categoriesController.close();
  }
}
import 'dart:async';

import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/models/Cart.dart';
import 'package:ecommerce_flutter/models/Product.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc implements BlocBase {
  Cart _cart = Cart();

  final _productController = StreamController<List<Product>>();
  Sink<List<Product>> get _intProducts => _productController.sink;
  Stream<List<Product>> get outProducts => _productController.stream;

  final _countController = BehaviorSubject<int>();
  Sink<int> get _intCount => _countController.sink;
  Stream<int> get outCount => _countController.stream;

  @override
  void dispose() {
    _productController.close();
    _countController.close();
  }
}

import 'dart:async';

import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/models/Cart.dart';
import 'package:ecommerce_flutter/models/Product.dart';

class CartBloc implements BlocBase {
  Cart _cart = Cart();

  final _productController = StreamController<List<Product>>();
  Sink<List<Product>> get _intProducts => _productController.sink;
  Stream<List<Product>> get outProducts => _productController.stream;

  @override
  void dispose() {
    _productController.close();
  }
}

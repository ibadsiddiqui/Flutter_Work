import 'package:ecommerce_flutter/models/Product.dart';
import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {
  final List<Product> products;

  SelectedCategoryPage({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: products.map(
            (product) => Text(product.name)
          ).toList(),
        ));
  }
}

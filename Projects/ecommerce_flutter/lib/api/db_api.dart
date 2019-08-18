import 'package:ecommerce_flutter/models/Category.dart';
import 'package:ecommerce_flutter/models/Product.dart';

class DbAPI {
  List<Category> getCategories() {
    List<Category> tempList = [Category(), Category(), Category(), Category()];
    return tempList;
  }

  List<Product> getProducts(Category category) {
    List<Product> tempList = [
      Product.create("product"),
      Product.create("product"),
      Product.create("product"),
      Product.create("product")
    ];
    return tempList;
  }
}

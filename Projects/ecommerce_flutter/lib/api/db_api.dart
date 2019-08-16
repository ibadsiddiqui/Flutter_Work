import 'package:ecommerce_flutter/models/Category.dart';

class DbAPI {
  static List<Category> getCategories() {
    List<Category> tempList = [Category(), Category(), Category(), Category()];
    return tempList;
  }
}

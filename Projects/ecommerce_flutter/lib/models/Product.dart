class Product {
  static const NAME_KEY = "name";

  String name;
  String id;
  int amount;

  Product.create(this.name);

  Product.fromFirestore(Map<String, dynamic> json) {
    name = json[NAME_KEY];
  }

  bool operator(o) => o is Product && o.name == this.name && o.id == id;

  int get hashcode => name.hashCode ^ id.hashCode;
}

class Product {
  String name;
  String id;
  int amount;

  Product.create(this.name);

  bool operator(o) => o is Product && o.name == this.name && o.id == id;

  int get hashcode => name.hashCode ^ id.hashCode;
}

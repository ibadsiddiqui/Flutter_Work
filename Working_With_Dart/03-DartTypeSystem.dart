// Dart
// Both are acceptable in Dart.
main(List<String> args) {
  String name = 'dart'; // Explicitly typed as a string.
  var otherName = 'Dart'; // Inferred string.
  var list = <dynamic>[];
  list.add(1);
  list.add("2");

  print(name);
  print(otherName);
  printInts(list);
  printObjects();
}

void printInts(List<dynamic> a) => print(a);

void printObjects() {
  Map<String, dynamic> arguments = {'argA': 'hello', 'argB': 42};
  print(arguments);
}

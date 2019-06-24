import 'package:flutter/material.dart';
import 'package:startup_namer/src/screens/WordsList/index.dart';

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: RandomWords(),
    );
  }
}

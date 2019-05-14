
import 'package:flutter/material.dart';

import 'RandomWords.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to flutter"),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());

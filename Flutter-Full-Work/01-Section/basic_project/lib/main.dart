import 'package:flutter/material.dart';
import "package:system_shortcuts/system_shortcuts.dart";

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: FlatButton(
        child: Text("Home"),
        onPressed: () async {
          await SystemShortcuts.home();
        },
      ),
    )));
  }
}

void main(List<String> args) {
  runApp(MyApp());
}

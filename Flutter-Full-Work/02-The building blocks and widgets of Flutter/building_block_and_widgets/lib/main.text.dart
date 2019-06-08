import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Chip(
            label: Text(
              "Salam", 
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)
            )
          )
        ),
      ),
    );
  }
}

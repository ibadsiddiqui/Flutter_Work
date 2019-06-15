import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String str = "Salam, My Name is Ibad";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("The title of the app comes here"),
          backgroundColor: Colors.teal,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Center(child: Text("Ibad here")),
      ),
    );
  }
}

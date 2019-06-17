import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() {
    return new _MainState();
  }
}

class _MainState extends State<Main> {
  String str = "Salam, My Name is Ibad";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.teal,
          child: Text('ibad here'),
        ),
      ),
    );
  }
}

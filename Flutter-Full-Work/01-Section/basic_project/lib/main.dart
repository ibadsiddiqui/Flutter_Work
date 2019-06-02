import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FlatButton(
            child: Text("Press Me"),
            onPressed: (){
              print("Salam");
            },
          )
        )
      ),
    );
  }
}

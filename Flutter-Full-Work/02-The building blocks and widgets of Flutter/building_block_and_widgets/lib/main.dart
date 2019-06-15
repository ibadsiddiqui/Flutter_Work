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
        body: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                elevation: 5.0,
                child: Text("Ibad Siddiqui",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold)),
              ),
            ),
            FlutterLogo(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String value = "Ibad siddiqui here";

  @override
  void initState() { 
    super.initState();
    print("state intiailized");  
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(value),
            ),
            FlatButton(child: Text("Press Me To Change"), 
              onPressed: () {
                value="Ibad here";
                print(value);
                setState(() {});
              },
            )
          ],
        )
      )
    );
  }
}

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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Image.asset("assets/images/hug.png", width: 100.0,height: 100.0,)),
            // Center(child: Image.network("https://previews.123rf.com/images/merkulovnik/merkulovnik1802/merkulovnik180200138/96702524-ink-drop-in-water-background.jpg", width: 100.0,height: 100.0,)),
            
            Chip(
                label: Text(str,
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlineButton(
                onPressed: () {
                  str = "The text just changed I think";
                  setState(() {});
                },
                child: Text("Press Me"),
              ),
            )
          ],
        )),
      ),
    );
  }
}

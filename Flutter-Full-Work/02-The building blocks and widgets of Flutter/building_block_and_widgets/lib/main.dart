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
          leading: Icon(Icons.access_time), // it is the left drawer icon on top
          actions: <Widget>[Icon(Icons.mic),Icon(Icons.mic)], // icons on the right
        ),
        body: Center(child: Text("Ibad here")),
        drawer: Drawer(
          child: Text("ibad siddiqui"),
        ),
        endDrawer: Drawer(child: Text("asd"),),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {},),
      ),
    );
  }
}

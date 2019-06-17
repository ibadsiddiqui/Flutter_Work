import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            // color: Colors.teal,
            child: Text('ibad'),
            // constraints: BoxConstraints(maxHeight: height, maxWidth: width),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                // color: Colors.teal
                // gradient: LinearGradient(colors: [Colors.teal, Colors.tealAccent])),
                // gradient: RadialGradient(colors: [Colors.teal, Colors.tealAccent])),
                )));
  }
}

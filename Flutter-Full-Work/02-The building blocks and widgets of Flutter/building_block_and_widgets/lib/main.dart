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
    return Scaffold(
      body: Center(
        // child: FlatButton(
        //   child: FlatButton.icon(
        //     icon: Icon(Icons.add),
        //     label: Text("Ibad Here"),
        //     onPressed: () {},
        //   ),
        //   onPressed: () {},
        // child: OutlineButton(
        //   child: Text("Press me "),
        //   borderSide: BorderSide(color: Colors.red),
        //   onPressed: () {},
        // ),
        // child: IconButton(
        //   icon: Icon(Icons.my_location),
        //   onPressed: () {},
        //   iconSize: 100,
        // ),
        child: RaisedButton(
          onPressed: () {},
          child: Text("Press Me"),
          elevation: 10,
        ),
      ),
    );
  }
}

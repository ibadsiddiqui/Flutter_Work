import 'package:calculator_flutter/src/widget/BottomWaveClipper/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color.fromARGB(200, 126, 87, 194),
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: Container(
        color: Color.fromARGB(200, 126, 87, 194),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipPath(
                clipper: BottomWaveClipper(),
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "20 + 80",
                              style: TextStyle(fontSize: 22.0),
                            ),
                            SizedBox(
                              child: Text(
                                "= 100",
                                style: TextStyle(fontSize: 22.0),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(flex: 1, child: myButton("AC")),
                          Expanded(flex: 1, child: myButton("7")),
                          Expanded(flex: 1, child: myButton("4")),
                          Expanded(flex: 1, child: myButton("1")),
                          Expanded(flex: 1, child: myButton("%")),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              flex: 1, child: myIconButton(Icons.backspace)),
                          Expanded(flex: 1, child: myButton("8")),
                          Expanded(flex: 1, child: myButton("5")),
                          Expanded(flex: 1, child: myButton("2")),
                          Expanded(flex: 1, child: myButton("0")),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(flex: 1, child: myButton("/")),
                          Expanded(flex: 1, child: myButton("9")),
                          Expanded(flex: 1, child: myButton("6")),
                          Expanded(flex: 1, child: myButton("3")),
                          Expanded(flex: 1, child: myButton(".")),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(flex: 0, child: myButton("+")),
                          Expanded(flex: 0, child: myButton("-")),
                          Expanded(flex: 0, child: myButton("X")),
                          Expanded(flex: 1, child: myButton("=")),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

FlatButton myIconButton(IconData icon) {
  return FlatButton(
      child: Icon(
        icon,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () {},
      color: Colors.transparent);
}

FlatButton myButton(String text) {
  return FlatButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      ),
      onPressed: () {},
      color: Colors.transparent);
}

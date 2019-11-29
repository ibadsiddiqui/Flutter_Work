import 'package:flutter/material.dart';

ThemeData generateTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: Color.fromRGBO(7, 104, 159, 1),
    ),
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(8, 51, 88, 1),
    accentColor: Colors.cyan[600],
    backgroundColor: Color.fromRGBO(7, 104, 159, 1),
    disabledColor: Color.fromRGBO(201, 214, 223, 1),
    buttonColor: Color.fromRGBO(17, 211, 188, 1),
    textTheme: TextTheme(
        body1: TextStyle(fontFamily: "Comfortaa", color: Colors.white),
        body2: TextStyle(fontFamily: "Comfortaa"),
        // display2: TextStyle(fontFamily: "CreteRound", fontSize: 15),
        display1: TextStyle(
            fontSize: 25,
            fontFamily: "CreteRound",
            color: Color.fromRGBO(8, 51, 88, 1)),
        display3: TextStyle(
            color: Color.fromRGBO(8, 51, 88, 1), fontFamily: "Comfortaa"),
        button: TextStyle(
            fontFamily: "CreteRound", color: Colors.white, fontSize: 15)
        // display4: TextStyle(
        //     fontFamily: "Comfortaa", color: Color.fromRGBO(8, 51, 88, 1)),
        // headline: TextStyle(
        //   color: Color.fromRGBO(8, 51, 88, 1),
        //   fontSize: 40,
        //   fontFamily: "CreteRound",
        // ),
        // title: TextStyle(fontSize: 25, fontFamily: "CreteRound"),
        // subhead: TextStyle(
        //   fontSize: 20,
        //   fontFamily: "CreteRound",
        //   color: Color.fromRGBO(8, 51, 88, 1),
        // ),
        // body1: TextStyle(
        //     fontFamily: "Comfortaa", color: Color.fromRGBO(8, 51, 88, 1)),
        // body2: TextStyle(
        //     fontFamily: "Comfortaa", color: Colors.white, fontSize: 14),
        // button: TextStyle(
        //     fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
  );
}

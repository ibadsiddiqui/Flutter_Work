import 'package:flutter/material.dart';

ThemeData generateTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: Color.fromRGBO(7, 104, 159, 1),
      // textTheme: TextTheme()
    ),
    // Define the default brightness and colors.

    brightness: Brightness.light,
    primaryColor: Colors.lightBlue[800],
    accentColor: Colors.cyan[600],
    backgroundColor: Color.fromRGBO(7, 104, 159, 1),
    disabledColor: Color.fromRGBO(201, 214, 223, 1),
    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    // buttonTheme: ButtonThemeData(buttonColor: Color.fromRGBO(17, 211, 188, 1)),
    buttonColor: Color.fromRGBO(17, 211, 188, 1),
    fontFamily: "CreteRound",
    textTheme: TextTheme(
        headline: TextStyle(
          color: Color.fromRGBO(8, 51, 88, 1),
          fontSize: 40,
          fontFamily: "CreteRound",
        ),
        title: TextStyle(fontSize: 25, fontFamily: "CreteRound"),
        subhead: TextStyle(
          fontSize: 20,
          fontFamily: "CreteRound",
          color: Color.fromRGBO(8, 51, 88, 1),
        ),
        body1: TextStyle(
            fontFamily: "Comfortaa", color: Color.fromRGBO(8, 51, 88, 1)),
        body2: TextStyle(
            fontFamily: "Comfortaa", color: Colors.white, fontSize: 14),
        display3: TextStyle(
            fontFamily: "Comfortaa", fontSize: 15, color: Colors.white),
        display4: TextStyle(
            fontFamily: "Comfortaa",
            fontSize: 15,
            color: Color.fromRGBO(8, 51, 88, 1)),
        button: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
  );
}

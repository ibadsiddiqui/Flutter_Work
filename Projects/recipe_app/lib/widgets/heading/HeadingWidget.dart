import 'package:flutter/material.dart';

Text buildText(String heading, context) {
  return Text(
    heading,
    textAlign: TextAlign.center,
    // style: TextStyle(
    //   fontFamily: 'Merriweather',
    //   fontSize: 40.0,
    //   color: const Color(0xFF807A6B),
    // ), // for declarative
    // for theme styling use bottom
    style: Theme.of(context).textTheme.headline,
  );
}

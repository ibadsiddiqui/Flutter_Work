import 'package:flutter/material.dart';

class FormHeading extends StatelessWidget {
  final String heading;

  const FormHeading({Key key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 22.0,
        color: Color(0xFF072247),
        fontFamily: "CreteRound",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

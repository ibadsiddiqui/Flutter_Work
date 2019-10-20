import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardHeading extends StatelessWidget {
  final String title;

  const OnBoardHeading({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "CreteRound",
            fontSize: 30,
            color: Colors.white,
            decorationStyle: TextDecorationStyle.dashed,
            decoration: TextDecoration.underline),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OnBoardHeading extends StatelessWidget {
  final String title;

  const OnBoardHeading({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Padding(
      padding: padding.flipped,
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

import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final Color color;

  const AppTitle({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 5.0),
      child: new Text(
        "Sufi Circles",
        style: TextStyle(
          color: color,
          fontSize: 40,
          fontFamily: "CreteRound",
        ),
      ),
    );
  }
}

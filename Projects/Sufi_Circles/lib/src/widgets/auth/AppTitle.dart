import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 5.0),
      child: new Text(
        "Sufi Circles",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontFamily: "CreteRound",
        ),
      ),
    );
  }
}

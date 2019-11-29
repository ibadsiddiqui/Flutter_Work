import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final Color color;

  AppTitle({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(color);
    return new Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 5.0),
      child: new Text(
        "Sufi Circles",
        style: color == null
            ? Theme.of(context).textTheme.headline
            : TextStyle(color: color, fontSize: 40, fontFamily: "CreteRound"),
      ),
    );
  }
}

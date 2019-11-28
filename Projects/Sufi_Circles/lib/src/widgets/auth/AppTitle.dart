import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final Color color;

  const AppTitle({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 5.0),
      child: color != null
          ? new Text(
              "Sufi Circles",
              style: Theme.of(context).textTheme.headline,
            )
          : new Text(
              "Sufi Circles",
              style: TextStyle(
                  color: Color.fromRGBO(8, 51, 88, 1),
                  fontSize: 40,
                  fontFamily: "CreteRound"),
            ),
    );
  }
}

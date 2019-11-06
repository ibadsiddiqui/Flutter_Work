import 'package:flutter/material.dart';

class DashboardHeadings extends StatelessWidget {
  final String title;

  const DashboardHeadings({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontFamily: "CreteRound", fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}

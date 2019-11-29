import 'package:flutter/material.dart';

class DashboardHeadings extends StatelessWidget {
  final String title;
  final Color color;
  const DashboardHeadings({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: color != null
            ? TextStyle(fontFamily: "CreteRound", fontSize: 25, color: color)
            : Theme.of(context).textTheme.display1,
      ),
    );
  }
}

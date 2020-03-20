import 'package:flutter/material.dart';

Widget buildHeadings(context, String heading) {
  return Container(
    padding: EdgeInsets.only(left: 10, top: 10),
    child: Text(
      heading,
      style: Theme.of(context).textTheme.display1,
      textAlign: TextAlign.left,
    ),
  );
}

Widget buildSubHeadings(context, String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      text,
      style: TextStyle(color: Theme.of(context).primaryColor),
      textAlign: TextAlign.left,
    ),
  );
}

Widget buildDescription(text) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
    ),
  );
}

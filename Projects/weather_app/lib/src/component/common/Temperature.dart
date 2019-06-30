import 'package:flutter/material.dart';

Widget TempSection(fontSize, imgName) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '20',
          style: TextStyle(fontSize: fontSize),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 12.0),
            margin: EdgeInsets.only(left: 6.0),
            child: Text(
              "\u2103",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
        Image.asset(
          imgName,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        )
      ],
    ),
  );
}

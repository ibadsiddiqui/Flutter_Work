import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget dateTime(double fontSize, FontWeight weight, Color textColor) {
  return Container(
      child: Text(
    (new DateFormat.yMMMd().format(new DateTime.now())),
    style:
        TextStyle(fontWeight: weight, color: textColor, fontSize: fontSize),
  ));
}

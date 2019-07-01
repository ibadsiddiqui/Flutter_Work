import 'package:flutter/material.dart';

Widget city(String city, String status) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          city,
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          status,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}

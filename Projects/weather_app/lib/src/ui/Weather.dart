import 'package:flutter/material.dart';
import 'package:weather_app/src/component/common/DateTime.dart';
import 'package:weather_app/src/component/common/Temperature.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Container(
      padding: EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dateTime(24.0, FontWeight.bold, Colors.black),
          TempSection(80.0, "assets/img/cloudy.png")
        ],
      ),
    );
  }
}

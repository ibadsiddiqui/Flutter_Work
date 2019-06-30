import 'package:flutter/material.dart';
import 'package:weather_app/src/component/common/DateTime.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget tempSection = Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '20',
            style: TextStyle(fontSize: 80.0),
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
            'assets/img/cloudy.png',
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dateTime(24.0, FontWeight.bold, Colors.black),
          tempSection
        ],
      ),
    );
  }
}

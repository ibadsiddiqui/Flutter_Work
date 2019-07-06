import 'package:flutter/material.dart';
import 'package:weather_app/src/component/common/CityAndWeather.dart';
import 'package:weather_app/src/component/common/DateTime.dart';
import 'package:weather_app/src/component/common/Temperature.dart';
import 'package:weather_app/src/model/Weather.model.dart';

class Weather extends StatelessWidget {
  final WeatherModel weatherModel;

  Weather({@required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dateTime(24.0, FontWeight.bold, Colors.black),
          TempSection(weatherModel.temp.toStringAsFixed(0), 80.0,
              "https://openweathermap.org/img/w/${weatherModel.icon}.png"),
          city(weatherModel.name, weatherModel.main)
        ],
      ),
    );
  }
}

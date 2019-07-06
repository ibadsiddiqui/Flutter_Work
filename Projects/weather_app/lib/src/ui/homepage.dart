import 'package:flutter/material.dart';
import 'package:weather_app/src/ui/Weather.dart';
import 'package:weather_app/src/model/Weather.model.dart';
import 'package:weather_app/src/model/MapAPI.model.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherModel _weatherModel;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: _weatherModel != null
          ? Weather(weatherModel: _weatherModel)
          : Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            ),
    );
  }

  // Future<Position> locateUser() async {
  //   return await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }

  getCurrentLocation() async {
    // var currentLoc = await locateUser();
    loadWeatherData(lat: 24.8667795, lon: 67.0311286);
  }

  loadWeatherData({double lat, double lon}) async {
    MapAPI mapAPI = MapAPI.getInstance();
    final data = await mapAPI.getWeather(lat: lat, lon: lon);
    setState(() {
      this._weatherModel = data;
    });
  }
}

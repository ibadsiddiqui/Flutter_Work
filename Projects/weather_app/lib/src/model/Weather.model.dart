import 'dart:convert';

class WeatherModel {
  String name;
  String main;
  String icon;
  double temp;

  WeatherModel({this.name, this.icon, this.main, this.temp});

  static Future<WeatherModel> deserialize(String json) async {
    JsonDecoder decoder = JsonDecoder();
    var map = await decoder.convert(json);
    String name = map['name'];
    String icon = map['icon'];
    String main = map['main'];
    double temp = map['temp'];

    return WeatherModel(name: name, icon: icon, main: main, temp: temp);
  }
}

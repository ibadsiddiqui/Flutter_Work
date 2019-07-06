import 'package:http/http.dart' show Client;
import 'Weather.model.dart';

class MapAPI {
  static const APIkey = "5400f1cd22623dcd19f97c721a65b72c";
  static const EndPoint = "http://api.openweathermap.org/data/2.5/";

  double lat, lon;
  Client client = Client();
  static MapAPI _instance;

  // ??= means that Assign the value only if the variable is null
  static MapAPI getInstance() => _instance ??= MapAPI();

  String _apiCall({double lat, double lon}) {
    return EndPoint +
        "/weather?lat=" +
        lat.toString() +
        "&lon=" +
        lon.toString() +
        "&APPID=" +
        APIkey +
        "&units=metric";
  }

  getWeather({double lat, double lon}) async {
    var response = await client.get(
        Uri.encodeFull(_apiCall(lat: lat, lon: lon)),
        headers: {'Accept': 'application/json'});
    return WeatherModel.deserialize(response.body);
  }
}

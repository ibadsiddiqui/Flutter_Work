import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class MapServices {
  Future<List<Placemark>> getCurrentPlacemark(double lat, double long) async {
    try {
      List<Placemark> placemark =
          await Geolocator().placemarkFromCoordinates(lat, long);
      return placemark;
    } on PlatformException {
      return [];
    }
  }

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}

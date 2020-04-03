import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class MapServices {
  Geolocator _geolocator = new Geolocator();
  Future getCurrentPlacemark(double lat, double long) async {
    try {
      List<Placemark> placemark =
          await _geolocator.placemarkFromCoordinates(lat, long);
      return placemark;
    } on PlatformException catch (e) {
      print(e);
      return [];
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future getCurrentLocation() async {
    try {
      return await _geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } on PlatformException catch (e) {
      print(e);
    } catch (e) {
      print(e);
      return [];
    }
  }
}

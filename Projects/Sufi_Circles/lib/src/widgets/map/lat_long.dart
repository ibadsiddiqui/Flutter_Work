import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng getLatLong(lat, long) {
  if (lat.runtimeType == double) return LatLng(lat, long);
  return LatLng(double.parse(lat), double.parse(long));
}

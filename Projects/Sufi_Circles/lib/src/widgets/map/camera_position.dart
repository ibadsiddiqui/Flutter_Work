import 'package:Sufi_Circles/src/widgets/map/lat_long.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

CameraPosition cameraPostionForMap(lat, long, {double zoom = 10}) {
  return CameraPosition(target: getLatLong(lat, long), zoom: zoom);
}

CameraUpdate updateCamera(lat, long, {double zoom = 10}) {
  return CameraUpdate.newLatLngZoom(getLatLong(lat, long), zoom);
}

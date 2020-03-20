import 'package:Sufi_Circles/src/widgets/map/camera_position.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget buildSmallMap(lat, long, markers) {
  return GoogleMap(
    myLocationEnabled: true,
    myLocationButtonEnabled: true,
    mapToolbarEnabled: true,
    initialCameraPosition:
        cameraPostionForMap(lat.toString(), long.toString(), zoom: 13.0),
    markers: markers,
    mapType: MapType.normal,
    onMapCreated: (controller) => controller.animateCamera(
      updateCamera(lat.toString(), long.toString(), zoom: 13.0),
    ),
  );
}


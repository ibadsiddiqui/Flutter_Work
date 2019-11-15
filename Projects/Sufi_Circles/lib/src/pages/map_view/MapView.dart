import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

// TODO: Add loader
// TODO : add current location name on pin
// TODO : make PIN draggable
// TODO : Pick PIN location on PIN drop
// TODO : Add dont button to select current location

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  Position currentLocation;

  @override
  void initState() {
    super.initState();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    setState(() {
      currentLocation = position;
    });
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(52.2165157, 6.9437819);
    print(placemark);
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(currentLocation.toString()),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(
          title: 'Historical City',
          snippet: '5 Star Rating',
        ),

        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    return _markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(currentLocation.latitude, currentLocation.longitude),
                // zoom: 10.0,
              ),
              markers: this.myMarker(),
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              onMapCreated: (controller) {
                setState(() {
                  myMapController = controller;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

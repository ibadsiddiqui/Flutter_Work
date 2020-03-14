import 'package:Sufi_Circles/src/services/maps/MapSerivce.dart';
import 'package:Sufi_Circles/src/widgets/fab/fab.dart';
import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:Sufi_Circles/src/widgets/map/camera_position.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final Function onSubmit;
  final Function onCancel;

  MapView({Key key, this.onSubmit, this.onCancel}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapServices _mapServices = MapServices();
  final Set<Marker> _markers = new Set();
  bool _isPickingLocation = false;

  Placemark _placemark;
  Position _currentLocation;

  @override
  void initState() {
    super.initState();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies() async {
    super.didChangeDependencies();
    this.setState(() => _isPickingLocation = true);
    Position position = await _mapServices.getCurrentLocation();
    await setPlaceMarks(position.latitude, position.longitude);

    this.setState(() {
      _isPickingLocation = false;
      _currentLocation = position;
    });
  }

  setPlaceMarks(double lat, double long, {dragOn = false}) async {
    List<Placemark> placemarks =
        await _mapServices.getCurrentPlacemark(lat, long);
    if (placemarks.isNotEmpty) {
      if (dragOn)
        this.setState(() {
          _placemark = placemarks[0];
          _currentLocation = placemarks[0].position;
        });
      else
        this.setState(() => _placemark = placemarks[0]);
    }
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        draggable: true,
        onDragEnd: (latlong) =>
            setPlaceMarks(latlong.latitude, latlong.longitude, dragOn: true),
        markerId: MarkerId("EventLocation"),
        position: LatLng(_currentLocation.latitude, _currentLocation.longitude),
        infoWindow: InfoWindow(
          title: _placemark.name.isEmpty ? "Unknown" : _placemark.name,
          snippet: _placemark.subLocality +
              " " +
              _placemark.thoroughfare +
              " " +
              _placemark.subAdministrativeArea +
              " " +
              _placemark.administrativeArea +
              " " +
              _placemark.country,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    return _markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _isPickingLocation
          ? null
          : BottomFABs(
              toolTip1: "Cancel",
              icon1: Icon(Icons.close),
              onPress1: () => widget.onCancel(),
              toolTip2: "Set location",
              icon2: Icon(Icons.check),
              onPress2: () => widget.onSubmit(_currentLocation, _placemark),
            ),
      body: _isPickingLocation
          ? Container(
              alignment: Alignment.center,
              child: Loader(
                dotOneColor: Colors.redAccent,
                dotTwoColor: Colors.blueAccent,
                dotThreeColor: Colors.greenAccent,
                dotType: DotType.circle,
                dotIcon: Icon(Icons.adjust),
                duration: Duration(milliseconds: 1000),
              ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: cameraPostionForMap(
                      _currentLocation.latitude,
                      _currentLocation.longitude,
                      zoom: 10.0,
                    ),
                    markers: this.myMarker(),
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    onMapCreated: (controller) {
                      controller.animateCamera(updateCamera(
                        _currentLocation.latitude,
                        _currentLocation.longitude,
                        zoom: 10,
                      ));
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

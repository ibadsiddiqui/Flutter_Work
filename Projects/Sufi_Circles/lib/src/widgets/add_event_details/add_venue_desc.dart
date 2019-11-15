import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:Sufi_Circles/src/models/event/EventModel.dart';

class AddVenueDesc extends StatefulWidget {
  @override
  _AddVenueDescState createState() => _AddVenueDescState();
}

class _AddVenueDescState extends State<AddVenueDesc> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(25.69893, 32.6421);

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
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
    // EventModel eventModel = Provider.of<EventModel>(context);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Maps With Marker'),
              backgroundColor: Colors.blue[900],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _mainLocation,
                      zoom: 10.0,
                    ),
                    markers: this.myMarker(),
                    mapType: MapType.normal,
                    onMapCreated: (controller) {
                      setState(() {
                        myMapController = controller;
                      });
                    },
                  ),
                ),
              ],
            )));
    // Container(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 18),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         FormHeading(heading: "Add venue details."),
    //         Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20.0),
    //           child: Text(
    //             "Please select from options below on how do you want to add the venue details?",
    //             style: TextStyle(fontSize: 18.0, fontFamily: "CreteRound"),
    //           ),
    //         ),
    //         RaisedButton(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(5.0)),
    //           elevation: 4.0,
    //           onPressed: () {},
    //           child: Container(
    //             alignment: Alignment.center,
    //             height: 50.0,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Icon(Icons.map, size: 20.0, color: Color(0xFF072247)),
    //                 Text(
    //                   " Add using map ",
    //                   style: TextStyle(
    //                       color: Color(0xFF072247),
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18.0),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           color: Colors.white,
    //         ),
    //         Container(
    //           padding: EdgeInsets.symmetric(vertical: 5.0),
    //           alignment: Alignment.center,
    //           child: Text(
    //             "OR",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(fontSize: 18.0, fontFamily: "CreteRound"),
    //           ),
    //         ),
    //         RaisedButton(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(5.0)),
    //           elevation: 4.0,
    //           onPressed: () {},
    //           child: Container(
    //             alignment: Alignment.center,
    //             height: 50.0,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Icon(Icons.map, size: 20.0, color: Color(0xFF072247)),
    //                 Text(
    //                   " Add details using inputs",
    //                   style: TextStyle(
    //                       color: Color(0xFF072247),
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18.0),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           color: Colors.white,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

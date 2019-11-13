import 'dart:async';

import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
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

  @override
  Widget build(BuildContext context) {
    // EventModel eventModel = Provider.of<EventModel>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
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

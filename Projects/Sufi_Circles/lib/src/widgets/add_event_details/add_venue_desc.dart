import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/map_view/MapView.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:flutter/material.dart';

class AddVenueDesc extends StatefulWidget {
  @override
  _AddVenueDescState createState() => _AddVenueDescState();
}

class _AddVenueDescState extends State<AddVenueDesc> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // EventModel eventModel = Provider.of<EventModel>(context);
    return Container(
      margin: EdgeInsets.only(top: size.width * 0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormHeading(heading: "Add venue details."),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20.0),
              child: Text(
                "Please select from options below on how do you want to add the venue details?",
                style: TextStyle(fontSize: 18.0, fontFamily: "CreteRound"),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () => pushScreen(context, screen: MapView()),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.map, size: 20.0, color: Color(0xFF072247)),
                    Text(
                      " Add using map",
                      style: TextStyle(
                          color: Color(0xFF072247),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              alignment: Alignment.center,
              child: Text(
                "OR",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontFamily: "CreteRound"),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.map, size: 20.0, color: Color(0xFF072247)),
                    Text(
                      " Add details using inputs",
                      style: TextStyle(
                          color: Color(0xFF072247),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

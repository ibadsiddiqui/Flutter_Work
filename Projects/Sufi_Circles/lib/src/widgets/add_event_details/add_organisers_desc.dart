import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AddOrganisersDetails extends StatefulWidget {
  @override
  _AddOrganisersDetailsState createState() => _AddOrganisersDetailsState();
}

class _AddOrganisersDetailsState extends State<AddOrganisersDetails> {
  String selectionType = "none";

  void setVenueDetails(Position position, Placemark placemark) {
    EventModel eventModel = Provider.of<EventModel>(context);
    eventModel.setEventVenueDetailsUsingMap(position, placemark);
    Navigator.of(context).pop();
    setSelectionType("View Details From Maps");
  }

  setSelectionType(text) => this.setState(() => selectionType = text);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final venueDetails = Provider.of<EventModel>(context);
    return Container(
      margin: EdgeInsets.only(top: size.width * 0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormHeading(heading: "Add Organiser's details. (optional)"),
            Observer(
              builder: (context) => Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Enter Organiser's email:..."),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Enter Organiser's contact number:..."),
                    ),
                  ],
                ),
              ),
            ),
            RoundClippedButton(isMain: false, onPress: () {}),
          ],
        ),
      ),
    );
  }
}

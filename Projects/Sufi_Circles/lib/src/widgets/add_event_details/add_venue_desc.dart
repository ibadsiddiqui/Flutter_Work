import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/map_view/MapView.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/picker_text.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/show_type_selection_for_venue.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/venue_detail_form.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AddVenueDesc extends StatefulWidget {
  @override
  _AddVenueDescState createState() => _AddVenueDescState();
}

class _AddVenueDescState extends State<AddVenueDesc> {
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
    final venueDetails = Provider.of<EventModel>(context);

    switch (selectionType) {
      case "View Details From Maps":
        return Container(
          margin: EdgeInsets.only(top: size.width * 0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FormHeading(heading: "Add venue details."),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child:
                      PickerText(text: "following is the data from the map..."),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Lat/Long",
                        style:
                            TextStyle(fontSize: 17.0, fontFamily: "CreteRound"),
                      ),
                      Text(
                        venueDetails.locationDetails.value["lat"].toString() +
                            " / " +
                            venueDetails.locationDetails.value["long"]
                                .toString(),
                        style:
                            TextStyle(fontSize: 17.0, fontFamily: "CreteRound"),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Lat/Long",
                        style:
                            TextStyle(fontSize: 17.0, fontFamily: "CreteRound"),
                      ),
                      Text(
                        venueDetails.locationDetails.value["lat"].toString() +
                            " / " +
                            venueDetails.locationDetails.value["long"]
                                .toString(),
                        style:
                            TextStyle(fontSize: 17.0, fontFamily: "CreteRound"),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundClippedButton(
                      isMain: true,
                      onPress: () => {},
                      title: "cancel",
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                    SizedBox(width: size.width * .2),
                    RoundClippedButton(isMain: false, onPress: () {}),
                  ],
                ),
              ],
            ),
          ),
        );
      case "Inputs":
        return VenueDetailForm(toggleSelectionType: setSelectionType);
      default:
        return ShowTypeSelectionForVenue(
          onPress2: () => this.setState(() => selectionType = "Inputs"),
          onPress1: () => pushScreen(
            context,
            screen: MapView(
                onCancel: () => Navigator.of(context).pop(),
                onSubmit: (pos, place) => setVenueDetails(pos, place)),
          ),
        );
    }
  }
}

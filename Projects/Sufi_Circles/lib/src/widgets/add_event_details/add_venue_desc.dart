import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/map_view/MapView.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/show_type_selection_for_venue.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/venue_detail_form.dart';
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
    switch (selectionType) {
      case "View Details From Maps":
        return Container();
      case "Inputs":
        return VenueDetailForm();
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

import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/map_view/MapView.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/info_sec_view.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/show_type_selection_for_venue.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/venue_detail_form.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AddVenueDesc extends StatefulWidget {
  final Function moveToNextPage;

  AddVenueDesc({Key key, this.moveToNextPage}) : super(key: key);
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
    final data = Provider.of<EventModel>(context);
    switch (selectionType) {
      case "View Details From Maps":
        return Container(
          margin: EdgeInsets.only(top: size.width * 0.1),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FormHeading(heading: "Add venue details.*"),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7.5),
                  child: Text(
                    "Venue details from map",
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .apply(fontWeightDelta: 900),
                  ),
                ),
                InfoSecView(
                  text: data.locationDetails.value["name"],
                  placeholder: "Name:",
                ),
                InfoSecView(
                  text: data.locationDetails.value["address"],
                  placeholder: "Address (optional):",
                ),
                InfoSecView(
                  text: data.locationDetails.value["city"],
                  placeholder: "City:",
                ),
                InfoSecView(
                  text: data.locationDetails.value["state"],
                  placeholder: "State:",
                ),
                InfoSecView(
                  text: data.locationDetails.value["country"],
                  placeholder: "Country:",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundClippedButton(
                      isMain: true,
                      onPress: () {
                        this.setSelectionType("none");
                        data.resetEventVenueDetail();
                      },
                      title: "cancel",
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                    SizedBox(width: size.width * .2),
                    RoundClippedButton(
                      isMain: false,
                      onPress: widget.moveToNextPage,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      case "Inputs":
        return VenueDetailForm(
          toggleSelectionType: setSelectionType,
          moveToNextPage: widget.moveToNextPage,
        );
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

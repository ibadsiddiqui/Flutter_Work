import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/map_view/MapView.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/picker_text.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/show_type_selection_for_venue.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AddVenueDesc extends StatefulWidget {
  @override
  _AddVenueDescState createState() => _AddVenueDescState();
}

class _AddVenueDescState extends State<AddVenueDesc> {
  String selectionType = "none";
  String dropdownValue = "One";

  void setVenueDetails(Position position, Placemark placemark) {
    EventModel eventModel = Provider.of<EventModel>(context);
    eventModel.setEventVenueDetails(position, placemark);
    Navigator.of(context).pop();
    this.setState(() => selectionType = "View Details From Maps");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    switch (selectionType) {
      case "View Details From Maps":
        return Container();
      case "Inputs":
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
                  child: PickerText(
                    text: "Please venues details in following below...",
                  ),
                ),
                UserDetailItem(
                  isEditable: true,
                  inputLabel: "Venue",
                  value: "",
                  toggleEdit: () {},
                  onSubmit: (String name) async {},
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  alignment: Alignment.center,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward),
                    // iconSize: 24,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward),
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                RaisedButton(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () => this.setState(() {
                    selectionType = "Inputs";
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.map, size: 20.0, color: Color(0xFF072247)),
                        Text(
                          " Submit",
                          style: TextStyle(
                              color: Color(0xFF072247),
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      default:
        return ShowTypeSelectionForVenue(
          onPress1: () => pushScreen(context,
              screen: MapView(
                  onCancel: () => Navigator.of(context).pop(),
                  onSubmit: (pos, place) => setVenueDetails(pos, place))),
          onPress2: () => this.setState(() {
            selectionType = "Inputs";
          }),
        );
    }
  }
}

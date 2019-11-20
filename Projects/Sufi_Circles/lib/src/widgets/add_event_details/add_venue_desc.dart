import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/map_view/MapView.dart';
import 'package:Sufi_Circles/src/utils/countries_city_list.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/picker_text.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_desc_widgets/show_type_selection_for_venue.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/dropdown/dropdown.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_details/edit_details_field.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_details/label.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_details/user_value.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AddVenueDesc extends StatefulWidget {
  @override
  _AddVenueDescState createState() => _AddVenueDescState();
}

class _AddVenueDescState extends State<AddVenueDesc> {
  String selectionType = "none";
  String selectedCountry = (getCountriesList())[0];
  String selectedCity = "les Escaldes";
  String selectedState = "Escaldes-Engordany";

  final List<String> countriesList = getCountriesList();

  void setVenueDetails(Position position, Placemark placemark) {
    EventModel eventModel = Provider.of<EventModel>(context);
    eventModel.setEventVenueDetails(position, placemark);
    Navigator.of(context).pop();
    setSelectionType("View Details From Maps");
  }

  setSelectionType(text) => this.setState(() => selectionType = text);

  _setCountrySelection(text) {
    String city = (getCitiesUsingCountry(text))[1];
    _setCitySelection(city);
    this.setState(() => selectedCountry = text);
  }

  _setCitySelection(text) => this.setState(() => selectedCity = text);

  _setStateOnSelection(text) => this.setState(() => selectedState = text);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    switch (selectionType) {
      case "View Details From Maps":
        return Container();
      case "Inputs":
        return Container(
          margin: EdgeInsets.only(
              top: selectionType == "Inputs"
                  ? size.width * 0.1
                  : size.width * 0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FormHeading(heading: "Add venue details."),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: PickerText(
                    text: "Please venues details in following below...",
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Add country from below:",
                        style:
                            TextStyle(fontSize: 15.0, fontFamily: "CreteRound"),
                      ),
                      DropDown(
                        list: countriesList,
                        onChanged: this._setCountrySelection,
                        value: this.selectedCountry,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Add country state from below:",
                        style:
                            TextStyle(fontSize: 15.0, fontFamily: "CreteRound"),
                      ),
                      DropDown(
                        list: getStateUsingCountry(this.selectedCountry),
                        onChanged: this._setStateOnSelection,
                        value: this.selectedState,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Add city from below:",
                        style:
                            TextStyle(fontSize: 15.0, fontFamily: "CreteRound"),
                      ),
                      DropDown(
                        list: getCitiesUsingCountry(this.selectedCountry),
                        onChanged: this._setCitySelection,
                        value: this.selectedCity,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Enter location/address:",
                        style:
                            TextStyle(fontSize: 15.0, fontFamily: "CreteRound"),
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Enter here ...'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Enter venue name:",
                        style:
                            TextStyle(fontSize: 15.0, fontFamily: "CreteRound"),
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Enter here ...'),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundClippedButton(
                      isMain: true,
                      onPress: () {},
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
      default:
        return ShowTypeSelectionForVenue(
          onPress2: () => this.setState(() => selectionType = "Inputs"),
          onPress1: () => pushScreen(context,
              screen: MapView(
                  onCancel: () => Navigator.of(context).pop(),
                  onSubmit: (pos, place) => setVenueDetails(pos, place))),
        );
    }
  }
}

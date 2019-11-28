import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/utils/countries_city_list.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/picker_text.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/dropdown/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VenueDetailForm extends StatefulWidget {
  final Function toggleSelectionType;

  VenueDetailForm({Key key, this.toggleSelectionType}) : super(key: key);

  @override
  _VenueDetailFormState createState() => _VenueDetailFormState();
}

class _VenueDetailFormState extends State<VenueDetailForm> {
  String _selectedCountry = (getCountriesList())[0];

  String _selectedCity = "les Escaldes";

  String _selectedState = "Escaldes-Engordany";

  String _address = "";

  String _venueName = "";

  final List<String> countriesList = getCountriesList();

  @protected
  @mustCallSuper
  void didChangeDependencies() async {
    Map details = Provider.of<EventModel>(context).locationDetails.value;
    if (details.isEmpty) {
      this.setState(() {
        _selectedState = (getStateUsingCountry(_selectedCountry))[1];
        _selectedCity = (getCitiesUsingCountry(_selectedState))[1];
      });
    } else {
      _setCountrySelection(details["country"]);
      _setStateOnSelection(details["state"]);
      _setCitySelection(details["city"]);
      _setAddress(details["address"]);
      _setVenueName(details["name"]);
    }
  }

  _setCountrySelection(text) {
    this.setState(() => _selectedCountry = text);
    String state = (getStateUsingCountry(text))[1];
    String city = (getCitiesUsingCountry(text))[1];

    _setStateOnSelection(state);
    _setCitySelection(city);
  }

  _setCitySelection(text) => this.setState(() => _selectedCity = text);

  _setStateOnSelection(text) => this.setState(() => _selectedState = text);

  _setAddress(address) => this.setState(() => _address = address);

  _setVenueName(name) => this.setState(() => _venueName = name);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    style: Theme.of(context).textTheme.display2,
                  ),
                  DropDown(
                    list: countriesList,
                    onChanged: this._setCountrySelection,
                    value: this._selectedCountry,
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
                    "Add state from below:",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  DropDown(
                    list: getStateUsingCountry(this._selectedCountry),
                    onChanged: this._setStateOnSelection,
                    value: this._selectedState,
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
                    style: Theme.of(context).textTheme.display2,
                  ),
                  DropDown(
                    list: getCitiesUsingCountry(this._selectedCountry),
                    onChanged: this._setCitySelection,
                    value: this._selectedCity,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Enter location/address:",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.display2,
                    onChanged: _setAddress,
                    decoration: InputDecoration(
                      hintText: "Enter here...",
                      hintStyle: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Enter venue name:",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.display2,
                    onChanged: _setVenueName,
                    decoration: InputDecoration(
                      hintText: "Enter here...",
                      hintStyle: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundClippedButton(
                  isMain: true,
                  onPress: () => widget.toggleSelectionType(""),
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
  }
}

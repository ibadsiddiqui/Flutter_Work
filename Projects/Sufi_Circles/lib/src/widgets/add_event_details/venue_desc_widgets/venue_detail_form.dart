import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/utils/countries_city_list.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/picker_text.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/dropdown/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    super.didChangeDependencies();
    EventModel data = Provider.of<EventModel>(context);
    if (data.locationDetails.isEmpty) {
      this.setState(() {
        _selectedState = (getStateUsingCountry(_selectedCountry))[1];
        _selectedCity = (getCitiesUsingState(_selectedState))[1];
      });
    } else {
      _setStateOnSelection(data.locationDetails["state"]);
      _setCitySelection(data.locationDetails["city"]);
      _setAddress(data.locationDetails["address"]);
      _setVenueName(data.locationDetails["name"]);
    }
  }

  _setCitySelection(text) => this.setState(() => _selectedCity = text);

  _setStateOnSelection(text) => this.setState(() => _selectedState = text);

  _setAddress(address) => this.setState(() => _address = address);

  _setVenueName(name) => this.setState(() => _venueName = name);

//
  _setCountry(String value, EventModel data) {
    data.locationDetails.addAll({
      "country": value,
      "state": (getStateUsingCountry(value))[1],
    });
  }

  _setStateForCountry(String value, EventModel data) {
    data.locationDetails.addAll({"state": value});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventModel>(
      builder: (__, data, ____) => Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FormHeading(heading: "Add venue details.*"),
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
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Observer(
                      builder: (_) => DropDown(
                        list: countriesList,
                        onChanged: (country) => this._setCountry(country, data),
                        value: data.locationDetails["country"],
                      ),
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
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Observer(
                      builder: (_) => DropDown(
                        list: getStateUsingCountry(
                            data.locationDetails["country"]),
                        onChanged: (state) =>
                            this._setStateForCountry(state, data),
                        value: data.locationDetails["state"],
                      ),
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
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Observer(
                      builder: (_) =>
                          getCitiesUsingState(data.locationDetails["state"])
                                      .length !=
                                  0
                              ? DropDown(
                                  list: getCitiesUsingState(
                                      data.locationDetails["state"]),
                                  onChanged: (city) => data.locationDetails
                                      .addAll({"city": city}),
                                  value: data.locationDetails["city"],
                                )
                              : Container(),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         "Enter location/address:",
              //         style: Theme.of(context).textTheme.body2,
              //       ),
              //       TextField(
              //         style: Theme.of(context).textTheme.body2,
              //         onChanged: _setAddress,
              //         decoration: InputDecoration(
              //           hintText: "Enter here...",
              //           hintStyle: Theme.of(context).textTheme.body2,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         "Enter venue name:",
              //         style: Theme.of(context).textTheme.body2,
              //       ),
              //       TextField(
              //         style: Theme.of(context).textTheme.body2,
              //         onChanged: _setVenueName,
              //         decoration: InputDecoration(
              //           hintText: "Enter here...",
              //           hintStyle: Theme.of(context).textTheme.body2,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     RoundClippedButton(
              //       isMain: true,
              //       onPress: () => widget.toggleSelectionType(""),
              //       title: "cancel",
              //       child: Icon(Icons.close, color: Colors.white),
              //     ),
              //     SizedBox(width: size.width * .2),
              //     RoundClippedButton(isMain: false, onPress: () {}),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

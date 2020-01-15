import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/utils/countries_city_list.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/picker_text.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/dropdown/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VenueDetailForm extends StatelessWidget {
  final List<String> countriesList = getCountriesList();
  final Function toggleSelectionType;
  final Function moveToNextPage;

  VenueDetailForm({Key key, this.toggleSelectionType, this.moveToNextPage})
      : super(key: key);

  _setCountry(String value, EventModel data) => data.locationDetails.addAll({
        "country": value,
        "state": (getStateUsingCountry(value))[1],
        "city": (getCitiesUsingCountry(value))[1],
      });

  _setStateForCountry(String value, EventModel data) =>
      data.locationDetails.addAll({"state": value});

  _setAddress(String value, EventModel data) =>
      data.locationDetails.addAll({"address": value});

  _setVenueName(String value, EventModel data) =>
      data.locationDetails.addAll({"name": value});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    EventModel data = Provider.of<EventModel>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                      list:
                          getStateUsingCountry(data.locationDetails["country"]),
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
              child: Observer(
                builder: (_) =>
                    getCitiesUsingCountry(data.locationDetails["country"])
                                .length !=
                            0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Add city from below:",
                                style: Theme.of(context).textTheme.body2,
                              ),
                              DropDown(
                                list: getCitiesUsingCountry(
                                    data.locationDetails["country"]),
                                onChanged: (city) =>
                                    data.locationDetails.addAll({"city": city}),
                                value: data.locationDetails["city"],
                              )
                            ],
                          )
                        : Container(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Enter location/address:",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.body2,
                    onChanged: (value) => this._setAddress(value, data),
                    decoration: InputDecoration(
                      hintText: "Enter here...",
                      hintStyle: Theme.of(context).textTheme.body2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Enter venue name:",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.body2,
                    onChanged: (value) => this._setVenueName(value, data),
                    decoration: InputDecoration(
                      hintText: "Enter here...",
                      hintStyle: Theme.of(context).textTheme.body2,
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
                  onPress: () {
                    toggleSelectionType("");
                    data.resetEventVenueDetail();
                  },
                  title: "cancel",
                  child: Icon(Icons.close, color: Colors.white),
                ),
                SizedBox(width: size.width * .2),
                RoundClippedButton(
                  isMain: false,
                  onPress: () {
                    if (data.locationDetails["name"].toString().isNotEmpty)
                      moveToNextPage();
                    else
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Please enter venue name."),
                      ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

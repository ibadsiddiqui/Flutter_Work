import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/date_picker.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';

class AddEventDate extends StatelessWidget {
  const AddEventDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 2, right: 2),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.3),
      child: Consumer<EventModel>(
        builder: (_, data, __) {
          var parsedDateFrom = DateTime.now();
          var parsedDateTo = DateTime.now();
          var dateFromNew = new DateFormat('yyyy-MM-dd').format(parsedDateFrom);
          var dateToNew = new DateFormat('yyyy-MM-dd').format(parsedDateTo);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: FormHeading(heading: "Add dates of the event."),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
                child: Text(
                  "At what date will it start?",
                  style: TextStyle(fontSize: 18.0, fontFamily: "CreteRound"),
                ),
              ),
              Observer(
                builder: (_) => EventDatePicker(
                  date: (data.dateTo.value.isEmpty
                      ? dateFromNew 
                      : data.dateTo.value),
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      theme: DatePickerTheme(containerHeight: 210.0),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31),
                      onConfirm: (date) => data.setEventFromDate(
                          ('${date.year} - ${date.month} - ${date.day}')),
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
                child: Text(
                  "At what date will it end?",
                  style: TextStyle(fontSize: 18.0, fontFamily: "CreteRound"),
                ),
              ),
              Observer(
                builder: (_) => EventDatePicker(
                  date: (data.dateTo.value.isEmpty
                      ? dateToNew
                      : data.dateTo.value),
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      theme: DatePickerTheme(containerHeight: 210.0),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31),
                      onConfirm: (date) {
                        data.setEventToDate(
                            '${date.year} - ${date.month} - ${date.day}');
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              RoundClippedButton(isMain: false, onPress: () {}),
            ],
          );
        },
      ),
    );
  }
}

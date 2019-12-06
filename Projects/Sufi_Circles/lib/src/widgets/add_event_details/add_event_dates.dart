import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/utils/date_helper.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/date_picker.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddEventDate extends StatelessWidget {
  const AddEventDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventModel data = Provider.of<EventModel>(context);
    DateTime dateTo = data.dateTo.value;
    DateTime dateFrom = data.dateFrom.value;
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: FormHeading(heading: "Add dates of the event.*"),
          ),
          Observer(
            builder: (_) => EventDatePicker(
              heading: "At what date will it start?",
              date: getFullDateString(dateFrom),
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  theme: DatePickerTheme(containerHeight: 210.0),
                  showTitleActions: true,
                  minTime: DateTime(2000, 1, 1),
                  maxTime: DateTime(2022, 12, 31),
                  onConfirm: (date) {
                    data.setEventFromDate(date);
                    data.setEventToDate(date);
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) => EventDatePicker(
              heading: "At what date will it end?",
              date: getFullDateString(dateTo),
              onPressed: () {
                DateTime pickedDate = dateFrom;
                DatePicker.showDatePicker(
                  context,
                  theme: DatePickerTheme(containerHeight: 210.0),
                  showTitleActions: true,
                  minTime: DateTime(
                      pickedDate.year, pickedDate.month, pickedDate.day),
                  onConfirm: (date) => data.setEventToDate(date),
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          dateTo.toString().isEmpty
              ? Container()
              : RoundClippedButton(
                  isMain: false,
                  onPress: () {
                    print(compareDate(dateTo, dateFrom));
                    if (compareDate(dateTo, dateFrom)) {}
                  }),
        ],
      ),
    );
  }
}

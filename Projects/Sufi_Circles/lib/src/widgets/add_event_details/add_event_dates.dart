import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/date_picker.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddEventDate extends StatelessWidget {
  final Function moveToNextPage;
  
  AddEventDate({Key key, this.moveToNextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventModel>(
      builder: (_, data, __) => Container(
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
                date: data.dateFrom.value.toString().split(" ")[0],
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
                date: data.dateTo.value.toString().split(" ")[0],
                onPressed: () {
                  DateTime pickedDate = data.dateFrom.value;
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
            SizedBox(height: 15),
            RoundClippedButton(
              isMain: false,
              onPress: moveToNextPage,
            ),
          ],
        ),
      ),
    );
  }
}

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            FormHeading(heading: "Add dates of the event.*"),
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
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.en,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            RoundClippedButton(isMain: false, onPress: moveToNextPage),
          ],
        ),
      ),
    );
  }
}

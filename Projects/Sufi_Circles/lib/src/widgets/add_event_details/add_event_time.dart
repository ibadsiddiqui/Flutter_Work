import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/time_picker.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';

class AddEventTime extends StatelessWidget {
  const AddEventTime({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 2, right: 2),
      child: Consumer<EventModel>(
        builder: (_, data, __) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: FormHeading(heading: "Add time of the event."),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 10.0),
                child: Text(
                  "At what time will it start?",
                  style: TextStyle(fontSize: 18.0, fontFamily: "CreteRound"),
                ),
              ),
              Observer(
                builder: (_) => TimePicker(
                    hour: data.startTime.value["hour"],
                    minute: data.startTime.value["minute"],
                    onPressed: () => DatePicker.showTimePicker(
                          context,
                          theme: DatePickerTheme(containerHeight: 210.0),
                          showTitleActions: true,
                          onConfirm: (time) =>
                              data.setEventStartTime(time.hour, time.minute),
                          currentTime: DateTime.now().toLocal(),
                          locale: LocaleType.en,
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 10.0),
                child: Text(
                  "At what time will it end?",
                  style: TextStyle(fontSize: 18.0, fontFamily: "CreteRound"),
                ),
              ),
              Observer(
                builder: (_) => TimePicker(
                    hour: data.startTime.value["hour"],
                    minute: data.startTime.value["minute"],
                    onPressed: () => DatePicker.showTimePicker(
                          context,
                          theme: DatePickerTheme(containerHeight: 210.0),
                          showTitleActions: true,
                          onConfirm: (time) =>
                              data.setEventEndTime(time.hour, time.minute),
                          currentTime: DateTime.now().toLocal(),
                          locale: LocaleType.en,
                        )),
              ),
              RoundClippedButton(isMain: false, onPress: () {}),
            ],
          );
        },
      ),
    );
  }
}

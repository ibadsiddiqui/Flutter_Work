import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/time_picker.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddEventTime extends StatelessWidget {
  final Function moveToNextPage;

  AddEventTime({Key key, this.moveToNextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<EventModel>(
        builder: (_, data, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: FormHeading(heading: "Add time of the event.*"),
              ),
              Observer(
                builder: (_) => TimePicker(
                  heading: "At what time will it start?",
                  hour: data.startTime.value["hour"],
                  minute: data.startTime.value["minute"],
                  onPressed: () => DatePicker.showTimePicker(
                    context,
                    showTitleActions: true,
                    theme: DatePickerTheme(containerHeight: 210.0),
                    locale: LocaleType.en,
                    currentTime: DateTime.now().toLocal(),
                    onConfirm: (time) =>
                        data.setEventStartTime(time.hour, time.minute),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Observer(
              //   builder: (_) => TimePicker(
              //       heading: "At what time will it end?",
              //       hour: data.endTime.value["hour"],
              //       minute: data.endTime.value["minute"],
              //       onPressed: () => DatePicker.showTimePicker(
              //             context,
              //             locale: LocaleType.en,
              //             theme: DatePickerTheme(containerHeight: 210.0),
              //             currentTime: DateTime.now().toLocal(),
              //             showTitleActions: true,
              //             onConfirm: (time) =>
              //                 data.setEventEndTime(time.hour, time.minute),
              //           )),
              // ),
              SizedBox(height: 20),
              RoundClippedButton(isMain: false, onPress: moveToNextPage),
            ],
          );
        },
      ),
    );
  }
}

import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/time_picker.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddEventTime extends StatelessWidget {
  const AddEventTime({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.3),
      padding: EdgeInsets.only(left: 2, right: 2),
      child: Consumer<EventModel>(
        builder: (_, data, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    theme: DatePickerTheme(containerHeight: 210.0),
                    showTitleActions: true,
                    onConfirm: (time) =>
                        data.setEventStartTime(time.hour, time.minute),
                    currentTime: DateTime.now().toLocal(),
                    locale: LocaleType.en,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_) => TimePicker(
                    heading: "At what time will it end?",
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
              SizedBox(height: 20),
              RoundClippedButton(isMain: false, onPress: () {}),
            ],
          );
        },
      ),
    );
  }
}

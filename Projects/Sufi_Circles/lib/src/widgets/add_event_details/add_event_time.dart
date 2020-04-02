import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/picker_text.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/time_picker.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/dropdown/dropdown.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer<EventModel>(
        builder: (_, data, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              FormHeading(heading: "Add time of the event.*"),
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
              Container(
                  padding: EdgeInsets.only(left: 5),
                  child:
                      PickerText(text: "What is the duration of the event?")),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Observer(
                      builder: (_) => DropDown(
                        list: ["1", "2", "3", "4", "5", "6", "7"],
                        value: data.duration.value,
                        onChanged: data.setEventDuration,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              RoundClippedButton(isMain: false, onPress: moveToNextPage),
            ],
          );
        },
      ),
    );
  }
}

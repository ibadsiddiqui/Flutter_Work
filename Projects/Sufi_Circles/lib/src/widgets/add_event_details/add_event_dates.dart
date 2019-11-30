import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/date_picker.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEventDate extends StatelessWidget {
  const AddEventDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Consumer<EventModel>(
        builder: (_, data, __) {
          var parsedDateFrom = DateTime.now();
          var parsedDateTo = DateTime.now();
          var dateFromNew = new DateFormat('yyyy-MM-dd').format(parsedDateFrom);
          var dateToNew = new DateFormat('yyyy-MM-dd').format(parsedDateTo);
          return Observer(
            builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: FormHeading(heading: "Add dates of the event.*"),
                ),
                EventDatePicker(
                  heading: "At what date will it start?",
                  date: (data.dateFrom.value.isEmpty
                      ? dateFromNew
                      : data.dateFrom.value),
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      theme: DatePickerTheme(containerHeight: 210.0),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31),
                      onConfirm: (date) => data.setEventFromDate(
                          ('${date.year}-${date.month}-${date.day}')),
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                ),
                SizedBox(height: 20),
                data.dateFrom.value.isNotEmpty
                    ? EventDatePicker(
                        heading: "At what date will it end?",
                        date: (data.dateTo.value.isEmpty
                            ? dateToNew
                            : data.dateTo.value),
                        onPressed: () {
                          int limitYear =
                              DateTime.parse(data.dateFrom.value).year;
                          int limitMonth =
                              DateTime.parse(data.dateFrom.value).month;
                          int limitDay =
                              DateTime.parse(data.dateFrom.value).day;

                          DatePicker.showDatePicker(
                            context,
                            theme: DatePickerTheme(containerHeight: 210.0),
                            showTitleActions: true,
                            minTime: DateTime(limitYear, limitMonth, limitDay),
                            onConfirm: (date) => data.setEventToDate(
                                '${date.year}-${date.month}-${date.day}'),
                            currentTime: DateTime.now(),
                            locale: LocaleType.en,
                          );
                        },
                      )
                    : Container(),
                SizedBox(height: 20),
                data.dateTo.value.isEmpty
                    ? Container()
                    : RoundClippedButton(isMain: false, onPress: () {}),
              ],
            ),
          );
        },
      ),
    );
  }
}

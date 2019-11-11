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
      child: Consumer<EventModel>(
        builder: (_, data, __) {
          var parsedDateFrom = DateTime.now();
          var parsedDateTo = DateTime.now();
          var dateFromNew = new DateFormat('yyyy-MM-dd').format(parsedDateFrom);
          var dateToNew = new DateFormat('yyyy-MM-dd').format(parsedDateTo);
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: FormHeading(heading: "Add dates of the event."),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 4.0,
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      theme: DatePickerTheme(containerHeight: 210.0),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31),
                      onConfirm: (date) {
                        data.setEventFromDate(
                            ('${date.year} - ${date.month} - ${date.day}'));
                        // setState(() {});
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                  child: Observer(
                    builder: (BuildContext context) => Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.date_range,
                                        size: 18.0, color: Color(0xFF072247)),
                                    Text(
                                      " From: " +
                                          (data.dateFrom.value.isEmpty
                                              ? dateFromNew
                                              : data.dateFrom.value),
                                      style: TextStyle(
                                          color: Color(0xFF072247),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Change",
                            style: TextStyle(
                                color: Color(0xFF072247),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 4.0,
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
                  child: Observer(
                    builder: (BuildContext context) => Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.date_range,
                                        size: 18.0, color: Color(0xFF072247)),
                                    Text(
                                      " To: " +
                                          (data.dateTo.value.isEmpty
                                              ? dateToNew
                                              : data.dateTo.value),
                                      style: TextStyle(
                                          color: Color(0xFF072247),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Change",
                            style: TextStyle(
                                color: Color(0xFF072247),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

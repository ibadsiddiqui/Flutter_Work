import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
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
          var time = TimeOfDay.now().hour % 12;
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child:
                    FormHeading(heading: "Add time of the event. (optional)"),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 4.0,
                  onPressed: () {
                    DatePicker.showTimePicker(
                      context,
                      theme: DatePickerTheme(containerHeight: 210.0),
                      showTitleActions: true,
                      onConfirm: (time) {
                        print(time);
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
                                      " Hour: " +
                                          time.toString() +
                                          " Min: " +
                                          time.toString(),
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

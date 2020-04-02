import 'package:Sufi_Circles/src/widgets/add_event_details/event_date_widgets/picker_text.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final Function onPressed;
  final int hour;
  final int minute;
  final String heading;

  const TimePicker(
      {Key key, this.onPressed, this.hour, this.minute, this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PickerText(text: heading),
        RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 4.0,
          onPressed: () => onPressed(),
          child: Container(
            alignment: Alignment.center,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.date_range,
                            size: 18.0, color: Color(0xFF072247)),
                        Text(
                          " Hour: " +
                              hour.toString() +
                              " Min: " +
                              minute.toString(),
                          style: TextStyle(
                              color: Color(0xFF072247),
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
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
          color: Colors.white,
        ),
      ],
    );
  }
}

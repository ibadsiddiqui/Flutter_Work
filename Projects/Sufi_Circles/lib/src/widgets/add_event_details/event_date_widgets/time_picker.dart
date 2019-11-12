import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final Function onPressed;
  final int hour;
  final int minute;
  const TimePicker({Key key, this.onPressed, this.hour, this.minute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
                  Container(
                    child: Row(
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
      color: Colors.white,
      ),
    );
  }
}

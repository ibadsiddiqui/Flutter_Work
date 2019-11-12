import 'package:flutter/material.dart';

class EventDatePicker extends StatelessWidget {
  final Function onPressed;
  final String date;
  const EventDatePicker({Key key, this.onPressed, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        onPressed: onPressed,
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
                          " $date",
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

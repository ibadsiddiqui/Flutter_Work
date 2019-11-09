import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';

class AddEventDate extends StatelessWidget {
  const AddEventDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<EventModel>(context).dateFrom.value);

    return Container(
      padding: EdgeInsets.only(left: 2, right: 2),
      child: Consumer<EventModel>(builder: (_, data, __) {
        var parsedDateFrom = DateTime.parse(data.dateFrom.value);
        var parsedDateTo = DateTime.parse(data.dateFrom.value);
        var dateFromNew = new DateFormat('yyyy-MM-dd').format(parsedDateFrom);
        var dateToNew = new DateFormat('yyyy-MM-dd').format(parsedDateTo);
        // print(formatted);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: FormHeading(heading: "Add dates of the event."),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "From:",
                      style: TextStyle(fontSize: 20, color: Color(0xFF072247)),
                    ),
                    Icon(Icons.calendar_today, size: 30),
                    Text(
                      dateFromNew,
                      // DateTime.pa(data.dateFrom.value),
                      style: TextStyle(fontSize: 20, color: Color(0xFF072247)),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "To:",
                      style: TextStyle(fontSize: 20, color: Color(0xFF072247)),
                    ),
                    Icon(Icons.calendar_today, size: 30),
                    Text(
                      dateToNew,
                      style: TextStyle(fontSize: 20, color: Color(0xFF072247)),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}

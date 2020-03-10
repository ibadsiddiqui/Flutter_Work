import 'package:Sufi_Circles/src/utils/date_helper.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';

class EventDetails extends StatelessWidget {
  final Map<String, dynamic> event;

  EventDetails({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String startDate = format(formatTimestamp(event["dateFrom"]));
    Map<String, int> startTime = event["starTime"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.01),
        elevation: 0,
      ),
      body: Container(
        child: Container(
          decoration: dashboardTopTabBackground(path: event["coverPhotoURL"]),
          height: size.height * 0.4,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                event["name"],
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .apply(color: Colors.white),
              ),
              Container(
                color: Colors.red,
                padding: EdgeInsets.all(10),
                child: Text('$startDate $startTime["hour"] - $startTime["minute"]'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

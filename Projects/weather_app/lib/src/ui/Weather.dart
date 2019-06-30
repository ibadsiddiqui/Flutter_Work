import 'package:flutter/material.dart';
import 'package:weather_app/src/component/common/DateTime.dart';

// Widget dateTime() {
//   return Container(
//       child: Text(
//     (new DateFormat.yMMMd().format(new DateTime.now())),
//     style: TextStyle(
//         fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0),
//   ));
// }

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[dateTime(24.0, FontWeight.bold, Colors.white)],
      ),
    );
  }
}

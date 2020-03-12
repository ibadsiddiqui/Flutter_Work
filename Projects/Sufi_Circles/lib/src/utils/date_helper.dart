import 'package:cloud_firestore/cloud_firestore.dart';

DateTime getCurrentDate() {
  DateTime now = new DateTime.now();
  return new DateTime(now.year, now.month, now.day);
}

DateTime formatTimestamp(Timestamp timestamp) {
  return DateTime.parse(timestamp.toDate().toString());
}

String formateDateAndTimeForEvent(Map<dynamic, dynamic> event) {
  String hour = (event["hour"] % 12).toString();
  String timePeriod = event["hour"] < 12 ? "AM" : "PM";
  String minute = event["minute"] < 10
      ? "0" + event["minute"].toString()
      : event["minute"].toString();
  return "$hour:$minute $timePeriod";
}

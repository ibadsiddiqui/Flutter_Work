import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

DateTime getCurrentDate() {
  DateTime now = new DateTime.now();
  return new DateTime(now.year, now.month, now.day);
}

DateTime formatTimestamp(Timestamp timestamp) {
  return DateTime.parse(timestamp.toDate().toString());
}

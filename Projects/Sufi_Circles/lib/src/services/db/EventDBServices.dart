import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class EventDBService {
  CollectionReference eventDB = Firestore.instance.collection("events");
  Uuid uuid = new Uuid();

  Future<bool> createEvent(Map<String, dynamic> details) async {
    try {
      await eventDB.document(details["eventID"]).setData(details);
      return true;
    } catch (e) {
      throw e;
    }
  }
}

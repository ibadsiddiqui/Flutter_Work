import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class EventDBService {
  CollectionReference eventDB = Firestore.instance.collection("events");
  Uuid uuid = new Uuid();

  Future<void> createEvent(Map<String, String> eventDetails) async {
    try {
      return (await eventDB.document(uuid.v4()).setData(eventDetails));
    } catch (e) {
      throw e;
    }
  }
}

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventDBService {
  CollectionReference eventDB = Firestore.instance.collection("events");

  Future<bool> createEvent(Map<String, dynamic> details) async {
    try {
      await eventDB.document(details["eventID"]).setData(details);
      return true;
    } catch (e) {
      throw e;
    }
  }

  Stream<QuerySnapshot> getAllEvent() {
    try {
      return eventDB.snapshots();
    } catch (e) {
      throw e;
    }
  }

  Future<QuerySnapshot> getLatestEventsSnapShot() {
    try {
      return eventDB.getDocuments();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> deleteEventAsync(String id) async {
    try {
      CollectionReference deletedEvents =
          Firestore.instance.collection("deleted-events");

      DocumentReference documentRef = eventDB.document(id);

      DocumentSnapshot document = await documentRef.get();
      await deletedEvents.document(document.documentID).setData(document.data);

      documentRef.delete();

      return true;
    } catch (e) {
      throw e;
    }
  }
}

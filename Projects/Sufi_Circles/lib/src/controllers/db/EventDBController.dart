import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/services/db/EventDBServices.dart';
import 'package:Sufi_Circles/src/services/storage/ImageStorage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EventDBController {
  EventDBService _eventDBService = new EventDBService();
  ImageStorage _imageStorage = new ImageStorage();
  Uuid uuid = new Uuid();

  Future<bool> createEvent(context) async {
    try {
      String eventID = uuid.v4();
      List<String> venuePhotosList = [];
      EventModel eventModel = Provider.of<EventModel>(context);
      Map<String, dynamic> eventData = eventModel.getEventModel();
      String coverPhotoURL = await _imageStorage.uploadEventPhoto(
          "cover", eventID, eventModel.eventCoverPhoto);
      if (!eventModel.isVenuePhotosEmpty)
        for (String url in eventModel.eventVenuePhoto) {
          String path =
              await _imageStorage.uploadEventPhoto("photos", eventID, url);
          venuePhotosList.add(path);
        }
      eventData.addAll({
        "eventID": eventID,
        "coverPhotoURL": coverPhotoURL,
        "venuePhotosURLList": venuePhotosList,
      });
      await _eventDBService.createEvent(eventData);
      return true;
    } catch (e) {
      throw e;
    }
  }

  Stream<QuerySnapshot> getAllEvent() {
    try {
      return _eventDBService.getAllEvent();
    } catch (e) {
      throw e;
    }
  }
}

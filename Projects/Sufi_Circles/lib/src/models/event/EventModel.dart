import 'package:Sufi_Circles/src/models/event/MetaData.dart';
import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'EventModel.g.dart';

class EventModel = _EventModel with _$EventModel;

abstract class _EventModel with Store {
  @observable
  Observable<String> eventName = Observable<String>("");

  @observable
  Observable<String> eventDesc = Observable<String>("");

  @observable
  Observable<String> eventAudience = Observable<String>(UNLIMITED);

  @observable
  Observable<String> eventAudienceLimitRange = Observable<String>(ZEROTO50);

  @observable
  String eventCoverPhoto = 'asset/images/placeholder/cover/index.png';

  @observable
  ObservableList<String> eventVenuePhoto = ObservableList<String>();

  @observable
  Observable<DateTime> dateFrom = Observable<DateTime>(DateTime.now());

  @observable
  Observable<String> duration = Observable<String>("1");

  @observable
  Observable<Map<String, dynamic>> startTime =
      Observable<Map<String, dynamic>>({
    "hour": DateTime.now().hour,
    "minute": DateTime.now().minute,
  });

  @observable
  Observable<Map<String, dynamic>> locationDetails =
      Observable<Map<String, dynamic>>({
    "country": "Andorra",
    "state": "Escaldes-Engordany",
    "city": "les Escaldes",
    "address": "",
    "name": "",
  });

  @observable
  Observable<String> organiserName = Observable("");

  @observable
  Observable<String> organiserEmail = Observable("");

  @observable
  Observable<String> organiserContactNo = Observable("");

  @observable
  String faceboookLink = "";

  @observable
  String webLink = "";

  @observable
  String instagramLink = "";

  @action
  void setEventOrganiserName(String name) => this.organiserName.value = name;

  @action
  void setEventOrganiserEmail(String email) =>
      this.organiserEmail.value = email;

  @action
  void setEventOrganiserContact(String contact) =>
      this.organiserContactNo.value = contact;

  @action
  void setEventName(String name) => this.eventName.value = name;

  @action
  void setEventDesc(String desc) => this.eventDesc.value = desc;

  @action
  void setEventAudience(String txt) => this.eventAudience.value = txt;

  @action
  void setEventAudienceLimit(String txt) =>
      this.eventAudienceLimitRange.value = txt;

  @action
  void setEventCoverPhoto(String name) => this.eventCoverPhoto = name;

  @action
  void resetEventCoverPhoto() =>
      this.eventCoverPhoto = 'asset/images/placeholder/cover/index.png';

  @action
  void addEventVenuePhoto(String path) => this.eventVenuePhoto.add(path);

  @action
  void resetEventVenuePhoto() =>
      this.eventVenuePhoto = ObservableList<String>();

  @action
  void setEventFromDate(DateTime date) => this.dateFrom.value = date;

  @action
  void setEventStartTime(int hour, int minute) {
    this.startTime.value = {
      "hour": hour,
      "minute": minute,
    };
  }

  @action
  void setEventDuration(String duration) => this.duration.value = duration;

  @action
  void resetEventVenueDetail() {
    this.locationDetails.value.addAll({
      "country": "Andorra",
      "state": "Escaldes-Engordany",
      "city": "les Escaldes",
      "address": "",
      "name": "",
      "lat": "",
      "long": ""
    });
  }

  @action
  void setEventVenueDetailsUsingMap(Position position, Placemark placemark) {
    String subArea = placemark.subLocality.isEmpty ? "" : placemark.subLocality;
    String localArea = placemark.thoroughfare.isEmpty
        ? subArea
        : (placemark.thoroughfare + ", " + subArea);

    String localAreaWithCode = placemark.postalCode.isEmpty
        ? localArea
        : localArea + ", " + placemark.postalCode;

    this.setEventVenueName(placemark.name);
    this.setEventVenueAddress(localAreaWithCode);
    this.setEventVenueCountry(placemark.country);
    this.setEventVenueCountryCity(placemark.locality);
    this.setEventVenueCountryState(placemark.administrativeArea);
    this.locationDetails.value["lat"] = position.latitude;
    this.locationDetails.value["long"] = position.longitude;
  }

  @action
  void setEventVenueCountry(String d) =>
      this.locationDetails.value["country"] = d;

  @action
  void setEventVenueCountryState(String s) =>
      this.locationDetails.value["state"] = s;

  @action
  void setEventVenueCountryCity(String c) =>
      this.locationDetails.value["city"] = c;

  @action
  void setEventVenueAddress(String ad) =>
      this.locationDetails.value["address"] = ad;

  @action
  void setEventVenueName(String name) =>
      this.locationDetails.value["name"] = name;

  @action
  void setEventFacebookLink(String name) => this.faceboookLink = name;

  @action
  void setEventWebLink(String name) => this.webLink = name;

  @action
  void setEventInstagramLink(String name) => this.instagramLink = name;

  @action
  void resetAll() {
    this.setEventOrganiserName("");
    this.setEventOrganiserEmail("");
    this.setEventOrganiserContact("");
    this.setEventName("");
    this.setEventDesc("");
    this.setEventAudience(UNLIMITED);
    this.setEventAudienceLimit(ZEROTO50);
    this.resetEventCoverPhoto();
    this.resetEventVenuePhoto();
    this.setEventFromDate(DateTime.now());
    this.setEventStartTime(DateTime.now().hour, DateTime.now().minute);
    this.setEventFacebookLink("");
    this.setEventWebLink("");
    this.setEventInstagramLink("");
  }

  @action
  Map<String, dynamic> getEventModel() {
    return {
      "name": this.eventName.value,
      "desc": this.eventDesc.value,
      "audience": this.eventAudience.value,
      "audienceRange": this.eventAudienceLimitRange.value,
      "dateFrom": this.dateFrom.value,
      "startTime": this.startTime.value,
      "locationDetails": this.locationDetails.value,
      "organiserDetails": {
        "organiserName": this.organiserName.value,
        "organiserEmail": this.organiserEmail.value,
        "organiserContactNo": this.organiserContactNo.value,
      },
      "eventLinks": {
        "instagram": this.instagramLink,
        "facebook": this.faceboookLink,
        "website": this.webLink
      }
    };
  }

  @computed
  get isVenuePhotosEmpty => isListEmpty(eventVenuePhoto);

  @computed
  get getPhotosLength => eventVenuePhoto.length;
}

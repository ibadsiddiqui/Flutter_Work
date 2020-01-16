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
  Observable<DateTime> dateTo = Observable<DateTime>(DateTime.now());

  @observable
  Observable<Map<String, dynamic>> startTime =
      Observable<Map<String, dynamic>>({
    "hour": DateTime.now().hour,
    "minute": DateTime.now().minute,
  });

  // @observable
  // Observable<Map<String, dynamic>> endTime = Observable<Map<String, dynamic>>({
  //   "hour": 0,
  //   "minute": 0,
  // });

  @observable
  Map<String, dynamic> addressDetails = {
    "venue": "",
    "city": "",
    "country": "",
  };

  @observable
  ObservableMap<String, dynamic> locationDetails =
      ObservableMap.splayTreeMapFrom({
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
  void setEventToDate(DateTime date) => this.dateTo.value = date;

  @action
  void setEventStartTime(int hour, int minute) {
    this.startTime.value = {
      "hour": hour,
      "minute": minute,
    };
  }

  // @action
  // void setEventEndTime(int hour, int minute) => this.endTime.value = {
  //       "hour": hour,
  //       "minute": minute,
  //     };

  @action
  void resetEventVenueDetail() {
    this.locationDetails = ObservableMap.splayTreeMapFrom({
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
    this.setEventVenueName(placemark.name);
    this.setEventVenueCountry(placemark.country);
    this.setEventVenueCountryCity(placemark.locality);
    this.setEventVenueCountryState(placemark.administrativeArea);
    this.setEventVenueAddress(placemark.thoroughfare);
    this.locationDetails["lat"] = position.latitude;
    this.locationDetails["long"] = position.longitude;
  }

  @action
  void setEventVenueCountry(String d) => this.locationDetails["country"] = d;

  @action
  void setEventVenueCountryState(String s) => this.locationDetails["state"] = s;

  @action
  void setEventVenueCountryCity(String c) => this.locationDetails["city"] = c;

  @action
  void setEventVenueAddress(String ad) => this.locationDetails["address"] = ad;

  @action
  void setEventVenueName(String name) => this.locationDetails["name"] = name;

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
    // this.resetEventVenueDetail();
    this.setEventFromDate(DateTime.now());
    this.setEventToDate(DateTime.now());
    this.setEventStartTime(0, 0);
    this.setEventFacebookLink("");
    this.setEventWebLink("");
    this.setEventInstagramLink("");
  }

  @computed
  get isVenuePhotosEmpty => isListEmpty(eventVenuePhoto);

  @computed
  get getPhotosLength => eventVenuePhoto.length;

  @computed
  get getEventDetail => {
        eventName = this.eventName,
        eventDesc = this.eventDesc,
        eventCoverPhoto = this.eventCoverPhoto,
        eventVenuePhoto = List(),
      };
}

import 'package:Sufi_Circles/src/models/event/MetaData.dart';
import 'package:Sufi_Circles/src/utils/countries_city_list.dart';
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
    "hour": 0,
    "minute": 0,
  });

  @observable
  Observable<Map<String, dynamic>> endTime = Observable<Map<String, dynamic>>({
    "hour": 0,
    "minute": 0,
  });

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
  Observable<Map<String, String>> organiserDetails =
      Observable<Map<String, String>>({
    "organiserName": "",
    "organiserEmail": "",
    "organiserContactNo": "",
  });

  @observable
  Map<String, String> additionalLinks = {};

  @action
  void setEventOrganiserName(String name) =>
      this.organiserDetails.value = {"organiserName": name};

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

  @action
  void setEventEndTime(int hour, int minute) => this.endTime.value = {
        "hour": hour,
        "minute": minute,
      };

  @action
  void setEventVenueDetailsUsingMap(Position position, Placemark placemark) {
    print(placemark);
    this.locationDetails = ObservableMap.splayTreeMapFrom({
      "lat": position.latitude,
      "long": position.longitude,
      "name": placemark.name,
      "area": placemark.thoroughfare,
      "city": placemark.locality,
      "state": placemark.administrativeArea,
      "country": placemark.country,
    });
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

  // TODO: add reset model state

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

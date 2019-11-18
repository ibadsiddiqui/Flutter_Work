import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'EventModel.g.dart';

class EventModel = _EventModel with _$EventModel;

abstract class _EventModel with Store {
  @observable
  Observable<String> eventName = Observable("");

  @observable
  Observable<String> eventDesc = Observable("");

  @observable
  String eventCoverPhoto = 'asset/images/placeholder/cover/index.png';

  @observable
  ObservableList<String> eventVenuePhoto = ObservableList<String>();

  @observable
  Observable<String> dateFrom = Observable<String>("");

  @observable
  Observable<String> dateTo = Observable<String>("");

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
  Observable<Map<String, dynamic>> locationDetails =
      Observable<Map<String, dynamic>>({});

  @observable
  Observable<Map<String, dynamic>> organiserDetails =
      Observable<Map<String, dynamic>>({});

  @observable
  Map<String, String> additionalLinks = {};

  @action
  void setEventName(String name) => this.eventName = name as Observable<String>;

  @action
  void setEventDesc(String name) => this.eventDesc = name as Observable<String>;

  @action
  void setEventCoverPhoto(String name) => this.eventCoverPhoto = name;

  @action
  void resetEventCoverPhoto() =>
      this.eventCoverPhoto = 'asset/images/placeholder/cover/index.png';

  @action
  void addEventVenuePhoto(String name) => this.eventVenuePhoto.add(name);

  @action
  void resetEventVenuePhoto() =>
      this.eventVenuePhoto = ObservableList<String>();

  @action
  void setEventFromDate(String date) => this.dateFrom.value = date;

  @action
  void setEventToDate(String date) => this.dateTo.value = date;

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
  void setEventVenueDetails(Position position, Placemark placemark) {
    this.locationDetails.value = {
      "lat": position.latitude,
      "long": position.longitude,
      "name": placemark.name.isEmpty ? "" : placemark.name,
      "area": placemark.subLocality.isEmpty ? "" : placemark.subLocality,
      "road": placemark.thoroughfare.isEmpty ? "" : placemark.thoroughfare,
      "city": placemark.subAdministrativeArea.isEmpty
          ? ""
          : placemark.subAdministrativeArea,
      "province": placemark.subAdministrativeArea.isEmpty
          ? ""
          : placemark.subAdministrativeArea,
      "country": placemark.subAdministrativeArea,
    };
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

import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
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
  Observable<String> timeFrom = Observable<String>("");

  @observable
  Observable<String> timeTo = Observable<String>("");

  @observable
  Map<String, dynamic> addressDetails = {
    "venue": "",
    "city": "",
    "country": "",
  };

  @observable
  Map<String, dynamic> locationDetails = {};

  @observable
  Map<String, dynamic> organiserDetails = {};

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
  void setEventFromDate(String date) =>
      this.dateFrom = Observable<String>(date);

  @action
  void setEventToDate(String date) => this.dateTo = Observable<String>(date);

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

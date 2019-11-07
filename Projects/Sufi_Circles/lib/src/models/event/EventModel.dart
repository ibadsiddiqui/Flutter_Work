import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:mobx/mobx.dart';

part 'EventModel.g.dart';

class EventModel = _EventModel with _$EventModel;

abstract class _EventModel with Store {
  @observable
  String eventName = "";

  @observable
  String eventDesc = "";

  @observable
  String eventCoverPhoto = 'asset/images/placeholder/cover/index.png';

  @observable
  List<String> eventVenuePhoto = List();

  @observable
  String dateFrom = DateTime.now().toLocal().toString();

  @observable
  String dateTo = DateTime.now().toLocal().toString();

  @observable
  String timeFrom = DateTime.now().toLocal().toString();

  @observable
  String timeTo = DateTime.now().toLocal().toString();

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
  void setEventName(String name) => this.eventName = name;

  @action
  void setEventDesc(String name) => this.eventDesc = name;

  @action
  void setEventCoverPhoto(String name) => this.eventCoverPhoto = name;

  @action
  void resetEventCoverPhoto() =>
      this.eventCoverPhoto = 'asset/images/placeholder/cover/index.png';

  @action
  void addEventVenuePhoto(String name) => this.eventVenuePhoto.add(name);

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

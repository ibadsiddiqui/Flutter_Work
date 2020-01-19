import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:mobx/mobx.dart';

part 'EventsListModel.g.dart';

class EventsListModel = _EventsListModel with _$EventsListModel;

abstract class _EventsListModel with Store {
  @observable
  List allEvents = List();

  @computed
  get checkIfEventsExist => this.allEvents.isEmpty;

  @action
  void setAllEvent(List events) => this.allEvents = events;

  @action
  String getEventName(int idx) => (this.allEvents[idx])["name"];

  @action
  String getEventDesc(int idx) => (this.allEvents[idx])["desc"];

  @action
  String getEventCoverPhoto(int idx) => (this.allEvents[idx])["coverPhotoURL"];

  @action
  String getEventVenuePhotos(int idx) => (this.allEvents[idx])["venuePhotosURLList"];

  @action
  Map<String, dynamic> getEventDetails(int idx) {
    return getEventDetailsUsingIndex(this.allEvents[idx]);
  }
}

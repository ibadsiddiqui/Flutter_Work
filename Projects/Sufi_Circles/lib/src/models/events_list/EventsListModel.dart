import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:mobx/mobx.dart';

part 'EventsListModel.g.dart';

class EventsListModel = _EventsListModel with _$EventsListModel;

abstract class _EventsListModel with Store {
  @observable
  List<Map<String, dynamic>> allEvents = List();

  @computed
  get checkIfEventsExist => this.allEvents.isEmpty;

  @action
  void setAllEvent(List events) => this.allEvents = events;

  @action
  void getEventName(int idx) => (this.allEvents[idx])["eventName"];

  @action
  void getEventDesc(int idx) => (this.allEvents[idx])["eventDesc"];

  @action
  void getEventCoverPhoto(int idx) => (this.allEvents[idx])["eventCoverPhoto"];

  @action
  void getEventVenuePhotos(int idx) => (this.allEvents[idx])["eventVenuePhoto"];

  @action
  Map<String, dynamic> getEventDetails(int idx) {
    return getEventDetailsUsingIndex(this.allEvents[idx]);
  }
}

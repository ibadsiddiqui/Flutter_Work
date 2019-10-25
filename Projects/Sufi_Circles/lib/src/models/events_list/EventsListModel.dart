import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:mobx/mobx.dart';

part 'EventsListModel.g.dart';

class EventsListModel = _EventsListModel with _$EventsListModel;

abstract class _EventsListModel with Store {
  @observable
  List<Map<String, dynamic>> allEvents = [
    {
      "eventName": "New Event 1",
      "eventDesc": "akjsduiasld jasd andandasnd ljansd lnas djnasld",
      "eventCoverPhoto": "asset/images/dummy_events/event_1.jpg",
      "eventVenuePhoto": List(),
    },
    {
      "eventName": "New Event 2",
      "eventDesc": "akjsduiasld jasd andandasnd ljansd lnas djnasld",
      "eventCoverPhoto": "asset/images/dummy_events/event_2.png",
      "eventVenuePhoto": List(),
    },
    {
      "eventName": "New Event 3",
      "eventDesc": "akjsduiasld jasd andandasnd ljansd lnas djnasld",
      "eventCoverPhoto": "asset/images/dummy_events/event_3.png",
      "eventVenuePhoto": List(),
    },
    {
      "eventName": "New Event 4",
      "eventDesc": "akjsduiasld jasd andandasnd ljansd lnas djnasld",
      "eventCoverPhoto": "asset/images/dummy_events/event_4.png",
      "eventVenuePhoto": List(),
    },
  ];

  @computed
  get checkIfEventsExist => allEvents.isEmpty;

  @action
  void getEventName(int idx) => (allEvents[idx])["eventName"];

  @action
  void getEventDesc(int idx) => (allEvents[idx])["eventDesc"];

  @action
  void getEventCoverPhoto(int idx) => (allEvents[idx])["eventCoverPhoto"];

  @action
  void getEventVenuePhotos(int idx) => (allEvents[idx])["eventVenuePhoto"];

  @action
  Map<String, dynamic> getEventDetails(int idx) {
    return getEventDetailsUsingIndex(allEvents[idx]);
  }
}

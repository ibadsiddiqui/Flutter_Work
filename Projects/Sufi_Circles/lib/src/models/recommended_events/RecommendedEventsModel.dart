import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:mobx/mobx.dart';

part 'RecommendedEventsModel.g.dart';

class RecommendedEventsModel = _RecommendedEventsModel
    with _$RecommendedEventsModel;

abstract class _RecommendedEventsModel with Store {
  @observable
  List<Map<String, dynamic>> recommendedEvents =[
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
    {
      "eventName": "New Event 4",
      "eventDesc": "akjsduiasld jasd andandasnd ljansd lnas djnasld",
      "eventCoverPhoto": "asset/images/dummy_events/event_4.png",
      "eventVenuePhoto": List(),
    },
  ];

  @computed
  get checkIfEventsExist => recommendedEvents.isEmpty;

  @action
  String getEventName(int idx) => (recommendedEvents[idx])["eventName"];

  @action
  String getEventDesc(int idx) => (recommendedEvents[idx])["eventDesc"];

  @action
  String getEventCoverPhoto(int idx) =>
      (recommendedEvents[idx])["eventCoverPhoto"];

  @action
  List getEventVenuePhotos(int idx) =>
      (recommendedEvents[idx])["eventVenuePhoto"];

  @action
  Map<String, dynamic> getEventDetails(int idx) {
    return getEventDetailsUsingIndex(recommendedEvents[idx]);
  }
}

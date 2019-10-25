Map<String, dynamic> getEventDetailsUsingIndex(Map<String, dynamic> details) {
  return {
    "eventName": details['eventName'],
    "eventDesc": details['eventDesc'],
    "eventCoverPhoto": details['eventCoverPhoto'],
    "eventVenuePhoto": details["eventVenuePhoto"],
  };
}

bool isListEmpty(List list) => list.isEmpty;

Map<String, dynamic> getEventDetailsUsingIndex(Map<String, dynamic> details) {
  return {
    "eventName": details['name'],
    "eventDesc": details['desc'],
    "eventCoverPhoto": details['coverPhotoURL'],
    "eventVenuePhoto": details["venuePhotosURLList"],
  };
}

bool isListEmpty(List list) => list.isEmpty;

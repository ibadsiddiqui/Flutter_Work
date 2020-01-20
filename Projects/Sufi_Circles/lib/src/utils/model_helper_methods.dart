Map<String, dynamic> getEventDetailsUsingIndex(details) {
  return {
    "name": details['name'],
    "desc": details['desc'],
    "coverPhotoURL": details['coverPhotoURL'],
    "venuePhotosURLList": details["venuePhotosURLList"],
  };
}

bool isListEmpty(List list) => list.isEmpty;

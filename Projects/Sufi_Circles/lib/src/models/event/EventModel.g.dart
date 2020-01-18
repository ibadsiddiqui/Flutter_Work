// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventModel on _EventModel, Store {
  Computed<dynamic> _$isVenuePhotosEmptyComputed;

  @override
  dynamic get isVenuePhotosEmpty => (_$isVenuePhotosEmptyComputed ??=
          Computed<dynamic>(() => super.isVenuePhotosEmpty))
      .value;
  Computed<dynamic> _$getPhotosLengthComputed;

  @override
  dynamic get getPhotosLength => (_$getPhotosLengthComputed ??=
          Computed<dynamic>(() => super.getPhotosLength))
      .value;
  Computed<dynamic> _$getEventDetailComputed;

  @override
  dynamic get getEventDetail => (_$getEventDetailComputed ??=
          Computed<dynamic>(() => super.getEventDetail))
      .value;

  final _$eventNameAtom = Atom(name: '_EventModel.eventName');

  @override
  Observable<String> get eventName {
    _$eventNameAtom.context.enforceReadPolicy(_$eventNameAtom);
    _$eventNameAtom.reportObserved();
    return super.eventName;
  }

  @override
  set eventName(Observable<String> value) {
    _$eventNameAtom.context.conditionallyRunInAction(() {
      super.eventName = value;
      _$eventNameAtom.reportChanged();
    }, _$eventNameAtom, name: '${_$eventNameAtom.name}_set');
  }

  final _$eventDescAtom = Atom(name: '_EventModel.eventDesc');

  @override
  Observable<String> get eventDesc {
    _$eventDescAtom.context.enforceReadPolicy(_$eventDescAtom);
    _$eventDescAtom.reportObserved();
    return super.eventDesc;
  }

  @override
  set eventDesc(Observable<String> value) {
    _$eventDescAtom.context.conditionallyRunInAction(() {
      super.eventDesc = value;
      _$eventDescAtom.reportChanged();
    }, _$eventDescAtom, name: '${_$eventDescAtom.name}_set');
  }

  final _$eventAudienceAtom = Atom(name: '_EventModel.eventAudience');

  @override
  Observable<String> get eventAudience {
    _$eventAudienceAtom.context.enforceReadPolicy(_$eventAudienceAtom);
    _$eventAudienceAtom.reportObserved();
    return super.eventAudience;
  }

  @override
  set eventAudience(Observable<String> value) {
    _$eventAudienceAtom.context.conditionallyRunInAction(() {
      super.eventAudience = value;
      _$eventAudienceAtom.reportChanged();
    }, _$eventAudienceAtom, name: '${_$eventAudienceAtom.name}_set');
  }

  final _$eventAudienceLimitRangeAtom =
      Atom(name: '_EventModel.eventAudienceLimitRange');

  @override
  Observable<String> get eventAudienceLimitRange {
    _$eventAudienceLimitRangeAtom.context
        .enforceReadPolicy(_$eventAudienceLimitRangeAtom);
    _$eventAudienceLimitRangeAtom.reportObserved();
    return super.eventAudienceLimitRange;
  }

  @override
  set eventAudienceLimitRange(Observable<String> value) {
    _$eventAudienceLimitRangeAtom.context.conditionallyRunInAction(() {
      super.eventAudienceLimitRange = value;
      _$eventAudienceLimitRangeAtom.reportChanged();
    }, _$eventAudienceLimitRangeAtom,
        name: '${_$eventAudienceLimitRangeAtom.name}_set');
  }

  final _$eventCoverPhotoAtom = Atom(name: '_EventModel.eventCoverPhoto');

  @override
  String get eventCoverPhoto {
    _$eventCoverPhotoAtom.context.enforceReadPolicy(_$eventCoverPhotoAtom);
    _$eventCoverPhotoAtom.reportObserved();
    return super.eventCoverPhoto;
  }

  @override
  set eventCoverPhoto(String value) {
    _$eventCoverPhotoAtom.context.conditionallyRunInAction(() {
      super.eventCoverPhoto = value;
      _$eventCoverPhotoAtom.reportChanged();
    }, _$eventCoverPhotoAtom, name: '${_$eventCoverPhotoAtom.name}_set');
  }

  final _$eventVenuePhotoAtom = Atom(name: '_EventModel.eventVenuePhoto');

  @override
  ObservableList<String> get eventVenuePhoto {
    _$eventVenuePhotoAtom.context.enforceReadPolicy(_$eventVenuePhotoAtom);
    _$eventVenuePhotoAtom.reportObserved();
    return super.eventVenuePhoto;
  }

  @override
  set eventVenuePhoto(ObservableList<String> value) {
    _$eventVenuePhotoAtom.context.conditionallyRunInAction(() {
      super.eventVenuePhoto = value;
      _$eventVenuePhotoAtom.reportChanged();
    }, _$eventVenuePhotoAtom, name: '${_$eventVenuePhotoAtom.name}_set');
  }

  final _$dateFromAtom = Atom(name: '_EventModel.dateFrom');

  @override
  Observable<DateTime> get dateFrom {
    _$dateFromAtom.context.enforceReadPolicy(_$dateFromAtom);
    _$dateFromAtom.reportObserved();
    return super.dateFrom;
  }

  @override
  set dateFrom(Observable<DateTime> value) {
    _$dateFromAtom.context.conditionallyRunInAction(() {
      super.dateFrom = value;
      _$dateFromAtom.reportChanged();
    }, _$dateFromAtom, name: '${_$dateFromAtom.name}_set');
  }

  final _$dateToAtom = Atom(name: '_EventModel.dateTo');

  @override
  Observable<DateTime> get dateTo {
    _$dateToAtom.context.enforceReadPolicy(_$dateToAtom);
    _$dateToAtom.reportObserved();
    return super.dateTo;
  }

  @override
  set dateTo(Observable<DateTime> value) {
    _$dateToAtom.context.conditionallyRunInAction(() {
      super.dateTo = value;
      _$dateToAtom.reportChanged();
    }, _$dateToAtom, name: '${_$dateToAtom.name}_set');
  }

  final _$startTimeAtom = Atom(name: '_EventModel.startTime');

  @override
  Observable<Map<String, dynamic>> get startTime {
    _$startTimeAtom.context.enforceReadPolicy(_$startTimeAtom);
    _$startTimeAtom.reportObserved();
    return super.startTime;
  }

  @override
  set startTime(Observable<Map<String, dynamic>> value) {
    _$startTimeAtom.context.conditionallyRunInAction(() {
      super.startTime = value;
      _$startTimeAtom.reportChanged();
    }, _$startTimeAtom, name: '${_$startTimeAtom.name}_set');
  }

  final _$locationDetailsAtom = Atom(name: '_EventModel.locationDetails');

  @override
  ObservableMap<String, dynamic> get locationDetails {
    _$locationDetailsAtom.context.enforceReadPolicy(_$locationDetailsAtom);
    _$locationDetailsAtom.reportObserved();
    return super.locationDetails;
  }

  @override
  set locationDetails(ObservableMap<String, dynamic> value) {
    _$locationDetailsAtom.context.conditionallyRunInAction(() {
      super.locationDetails = value;
      _$locationDetailsAtom.reportChanged();
    }, _$locationDetailsAtom, name: '${_$locationDetailsAtom.name}_set');
  }

  final _$organiserNameAtom = Atom(name: '_EventModel.organiserName');

  @override
  Observable<String> get organiserName {
    _$organiserNameAtom.context.enforceReadPolicy(_$organiserNameAtom);
    _$organiserNameAtom.reportObserved();
    return super.organiserName;
  }

  @override
  set organiserName(Observable<String> value) {
    _$organiserNameAtom.context.conditionallyRunInAction(() {
      super.organiserName = value;
      _$organiserNameAtom.reportChanged();
    }, _$organiserNameAtom, name: '${_$organiserNameAtom.name}_set');
  }

  final _$organiserEmailAtom = Atom(name: '_EventModel.organiserEmail');

  @override
  Observable<String> get organiserEmail {
    _$organiserEmailAtom.context.enforceReadPolicy(_$organiserEmailAtom);
    _$organiserEmailAtom.reportObserved();
    return super.organiserEmail;
  }

  @override
  set organiserEmail(Observable<String> value) {
    _$organiserEmailAtom.context.conditionallyRunInAction(() {
      super.organiserEmail = value;
      _$organiserEmailAtom.reportChanged();
    }, _$organiserEmailAtom, name: '${_$organiserEmailAtom.name}_set');
  }

  final _$organiserContactNoAtom = Atom(name: '_EventModel.organiserContactNo');

  @override
  Observable<String> get organiserContactNo {
    _$organiserContactNoAtom.context
        .enforceReadPolicy(_$organiserContactNoAtom);
    _$organiserContactNoAtom.reportObserved();
    return super.organiserContactNo;
  }

  @override
  set organiserContactNo(Observable<String> value) {
    _$organiserContactNoAtom.context.conditionallyRunInAction(() {
      super.organiserContactNo = value;
      _$organiserContactNoAtom.reportChanged();
    }, _$organiserContactNoAtom, name: '${_$organiserContactNoAtom.name}_set');
  }

  final _$faceboookLinkAtom = Atom(name: '_EventModel.faceboookLink');

  @override
  String get faceboookLink {
    _$faceboookLinkAtom.context.enforceReadPolicy(_$faceboookLinkAtom);
    _$faceboookLinkAtom.reportObserved();
    return super.faceboookLink;
  }

  @override
  set faceboookLink(String value) {
    _$faceboookLinkAtom.context.conditionallyRunInAction(() {
      super.faceboookLink = value;
      _$faceboookLinkAtom.reportChanged();
    }, _$faceboookLinkAtom, name: '${_$faceboookLinkAtom.name}_set');
  }

  final _$webLinkAtom = Atom(name: '_EventModel.webLink');

  @override
  String get webLink {
    _$webLinkAtom.context.enforceReadPolicy(_$webLinkAtom);
    _$webLinkAtom.reportObserved();
    return super.webLink;
  }

  @override
  set webLink(String value) {
    _$webLinkAtom.context.conditionallyRunInAction(() {
      super.webLink = value;
      _$webLinkAtom.reportChanged();
    }, _$webLinkAtom, name: '${_$webLinkAtom.name}_set');
  }

  final _$instagramLinkAtom = Atom(name: '_EventModel.instagramLink');

  @override
  String get instagramLink {
    _$instagramLinkAtom.context.enforceReadPolicy(_$instagramLinkAtom);
    _$instagramLinkAtom.reportObserved();
    return super.instagramLink;
  }

  @override
  set instagramLink(String value) {
    _$instagramLinkAtom.context.conditionallyRunInAction(() {
      super.instagramLink = value;
      _$instagramLinkAtom.reportChanged();
    }, _$instagramLinkAtom, name: '${_$instagramLinkAtom.name}_set');
  }

  final _$_EventModelActionController = ActionController(name: '_EventModel');

  @override
  void setEventOrganiserName(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventOrganiserName(name);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventOrganiserEmail(String email) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventOrganiserEmail(email);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventOrganiserContact(String contact) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventOrganiserContact(contact);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventName(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventName(name);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventDesc(String desc) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventDesc(desc);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventAudience(String txt) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventAudience(txt);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventAudienceLimit(String txt) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventAudienceLimit(txt);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventCoverPhoto(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventCoverPhoto(name);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEventCoverPhoto() {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.resetEventCoverPhoto();
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEventVenuePhoto(String path) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.addEventVenuePhoto(path);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEventVenuePhoto() {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.resetEventVenuePhoto();
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventFromDate(DateTime date) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventFromDate(date);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventToDate(DateTime date) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventToDate(date);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventStartTime(int hour, int minute) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventStartTime(hour, minute);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEventVenueDetail() {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.resetEventVenueDetail();
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventVenueDetailsUsingMap(Position position, Placemark placemark) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventVenueDetailsUsingMap(position, placemark);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventVenueCountry(String d) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventVenueCountry(d);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventVenueCountryState(String s) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventVenueCountryState(s);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventVenueCountryCity(String c) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventVenueCountryCity(c);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventVenueAddress(String ad) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventVenueAddress(ad);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventVenueName(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventVenueName(name);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventFacebookLink(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventFacebookLink(name);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventWebLink(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventWebLink(name);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventInstagramLink(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventInstagramLink(name);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAll() {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.resetAll();
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, dynamic> getEventModel() {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.getEventModel();
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }
}

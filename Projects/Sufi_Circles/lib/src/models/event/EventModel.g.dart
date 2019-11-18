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
  Observable<String> get dateFrom {
    _$dateFromAtom.context.enforceReadPolicy(_$dateFromAtom);
    _$dateFromAtom.reportObserved();
    return super.dateFrom;
  }

  @override
  set dateFrom(Observable<String> value) {
    _$dateFromAtom.context.conditionallyRunInAction(() {
      super.dateFrom = value;
      _$dateFromAtom.reportChanged();
    }, _$dateFromAtom, name: '${_$dateFromAtom.name}_set');
  }

  final _$dateToAtom = Atom(name: '_EventModel.dateTo');

  @override
  Observable<String> get dateTo {
    _$dateToAtom.context.enforceReadPolicy(_$dateToAtom);
    _$dateToAtom.reportObserved();
    return super.dateTo;
  }

  @override
  set dateTo(Observable<String> value) {
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

  final _$endTimeAtom = Atom(name: '_EventModel.endTime');

  @override
  Observable<Map<String, dynamic>> get endTime {
    _$endTimeAtom.context.enforceReadPolicy(_$endTimeAtom);
    _$endTimeAtom.reportObserved();
    return super.endTime;
  }

  @override
  set endTime(Observable<Map<String, dynamic>> value) {
    _$endTimeAtom.context.conditionallyRunInAction(() {
      super.endTime = value;
      _$endTimeAtom.reportChanged();
    }, _$endTimeAtom, name: '${_$endTimeAtom.name}_set');
  }

  final _$addressDetailsAtom = Atom(name: '_EventModel.addressDetails');

  @override
  Map<String, dynamic> get addressDetails {
    _$addressDetailsAtom.context.enforceReadPolicy(_$addressDetailsAtom);
    _$addressDetailsAtom.reportObserved();
    return super.addressDetails;
  }

  @override
  set addressDetails(Map<String, dynamic> value) {
    _$addressDetailsAtom.context.conditionallyRunInAction(() {
      super.addressDetails = value;
      _$addressDetailsAtom.reportChanged();
    }, _$addressDetailsAtom, name: '${_$addressDetailsAtom.name}_set');
  }

  final _$locationDetailsAtom = Atom(name: '_EventModel.locationDetails');

  @override
  Observable<Map<String, dynamic>> get locationDetails {
    _$locationDetailsAtom.context.enforceReadPolicy(_$locationDetailsAtom);
    _$locationDetailsAtom.reportObserved();
    return super.locationDetails;
  }

  @override
  set locationDetails(Observable<Map<String, dynamic>> value) {
    _$locationDetailsAtom.context.conditionallyRunInAction(() {
      super.locationDetails = value;
      _$locationDetailsAtom.reportChanged();
    }, _$locationDetailsAtom, name: '${_$locationDetailsAtom.name}_set');
  }

  final _$organiserDetailsAtom = Atom(name: '_EventModel.organiserDetails');

  @override
  Observable<Map<String, dynamic>> get organiserDetails {
    _$organiserDetailsAtom.context.enforceReadPolicy(_$organiserDetailsAtom);
    _$organiserDetailsAtom.reportObserved();
    return super.organiserDetails;
  }

  @override
  set organiserDetails(Observable<Map<String, dynamic>> value) {
    _$organiserDetailsAtom.context.conditionallyRunInAction(() {
      super.organiserDetails = value;
      _$organiserDetailsAtom.reportChanged();
    }, _$organiserDetailsAtom, name: '${_$organiserDetailsAtom.name}_set');
  }

  final _$additionalLinksAtom = Atom(name: '_EventModel.additionalLinks');

  @override
  Map<String, String> get additionalLinks {
    _$additionalLinksAtom.context.enforceReadPolicy(_$additionalLinksAtom);
    _$additionalLinksAtom.reportObserved();
    return super.additionalLinks;
  }

  @override
  set additionalLinks(Map<String, String> value) {
    _$additionalLinksAtom.context.conditionallyRunInAction(() {
      super.additionalLinks = value;
      _$additionalLinksAtom.reportChanged();
    }, _$additionalLinksAtom, name: '${_$additionalLinksAtom.name}_set');
  }

  final _$_EventModelActionController = ActionController(name: '_EventModel');

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
  void setEventDesc(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventDesc(name);
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
  void addEventVenuePhoto(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.addEventVenuePhoto(name);
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
  void setEventFromDate(String date) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventFromDate(date);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventToDate(String date) {
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
  void setEventEndTime(int hour, int minute) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventEndTime(hour, minute);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventVenueDetails(Position position, Placemark placemark) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.setEventVenueDetails(position, placemark);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }
}

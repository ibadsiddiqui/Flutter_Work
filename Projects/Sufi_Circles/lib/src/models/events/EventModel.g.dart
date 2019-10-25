// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventModel on _EventModel, Store {
  Computed<dynamic> _$isVenuePhotoEmptyComputed;

  @override
  dynamic get isVenuePhotoEmpty => (_$isVenuePhotoEmptyComputed ??=
          Computed<dynamic>(() => super.isVenuePhotoEmpty))
      .value;
  Computed<dynamic> _$getPhotosLengthComputed;

  @override
  dynamic get getPhotosLength => (_$getPhotosLengthComputed ??=
          Computed<dynamic>(() => super.getPhotosLength))
      .value;

  final _$eventNameAtom = Atom(name: '_EventModel.eventName');

  @override
  String get eventName {
    _$eventNameAtom.context.enforceReadPolicy(_$eventNameAtom);
    _$eventNameAtom.reportObserved();
    return super.eventName;
  }

  @override
  set eventName(String value) {
    _$eventNameAtom.context.conditionallyRunInAction(() {
      super.eventName = value;
      _$eventNameAtom.reportChanged();
    }, _$eventNameAtom, name: '${_$eventNameAtom.name}_set');
  }

  final _$eventDescAtom = Atom(name: '_EventModel.eventDesc');

  @override
  String get eventDesc {
    _$eventDescAtom.context.enforceReadPolicy(_$eventDescAtom);
    _$eventDescAtom.reportObserved();
    return super.eventDesc;
  }

  @override
  set eventDesc(String value) {
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
  List<String> get eventVenuePhoto {
    _$eventVenuePhotoAtom.context.enforceReadPolicy(_$eventVenuePhotoAtom);
    _$eventVenuePhotoAtom.reportObserved();
    return super.eventVenuePhoto;
  }

  @override
  set eventVenuePhoto(List<String> value) {
    _$eventVenuePhotoAtom.context.conditionallyRunInAction(() {
      super.eventVenuePhoto = value;
      _$eventVenuePhotoAtom.reportChanged();
    }, _$eventVenuePhotoAtom, name: '${_$eventVenuePhotoAtom.name}_set');
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
  void addEventVenuePhoto(String name) {
    final _$actionInfo = _$_EventModelActionController.startAction();
    try {
      return super.addEventVenuePhoto(name);
    } finally {
      _$_EventModelActionController.endAction(_$actionInfo);
    }
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecommendedEventsModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecommendedEventsModel on _RecommendedEventsModel, Store {
  Computed<dynamic> _$checkIfEventsExistComputed;

  @override
  dynamic get checkIfEventsExist => (_$checkIfEventsExistComputed ??=
          Computed<dynamic>(() => super.checkIfEventsExist))
      .value;

  final _$recommendedEventsAtom =
      Atom(name: '_RecommendedEventsModel.recommendedEvents');

  @override
  List<Map<String, dynamic>> get recommendedEvents {
    _$recommendedEventsAtom.context.enforceReadPolicy(_$recommendedEventsAtom);
    _$recommendedEventsAtom.reportObserved();
    return super.recommendedEvents;
  }

  @override
  set recommendedEvents(List<Map<String, dynamic>> value) {
    _$recommendedEventsAtom.context.conditionallyRunInAction(() {
      super.recommendedEvents = value;
      _$recommendedEventsAtom.reportChanged();
    }, _$recommendedEventsAtom, name: '${_$recommendedEventsAtom.name}_set');
  }

  final _$_RecommendedEventsModelActionController =
      ActionController(name: '_RecommendedEventsModel');

  @override
  String getEventName(int idx) {
    final _$actionInfo =
        _$_RecommendedEventsModelActionController.startAction();
    try {
      return super.getEventName(idx);
    } finally {
      _$_RecommendedEventsModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getEventDesc(int idx) {
    final _$actionInfo =
        _$_RecommendedEventsModelActionController.startAction();
    try {
      return super.getEventDesc(idx);
    } finally {
      _$_RecommendedEventsModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getEventCoverPhoto(int idx) {
    final _$actionInfo =
        _$_RecommendedEventsModelActionController.startAction();
    try {
      return super.getEventCoverPhoto(idx);
    } finally {
      _$_RecommendedEventsModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  List getEventVenuePhotos(int idx) {
    final _$actionInfo =
        _$_RecommendedEventsModelActionController.startAction();
    try {
      return super.getEventVenuePhotos(idx);
    } finally {
      _$_RecommendedEventsModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, dynamic> getEventDetails(int idx) {
    final _$actionInfo =
        _$_RecommendedEventsModelActionController.startAction();
    try {
      return super.getEventDetails(idx);
    } finally {
      _$_RecommendedEventsModelActionController.endAction(_$actionInfo);
    }
  }
}

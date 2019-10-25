// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventsListModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsListModel on _EventsListModel, Store {
  Computed<dynamic> _$checkIfEventsExistComputed;

  @override
  dynamic get checkIfEventsExist => (_$checkIfEventsExistComputed ??=
          Computed<dynamic>(() => super.checkIfEventsExist))
      .value;

  final _$allEventsAtom = Atom(name: '_EventsListModel.allEvents');

  @override
  List<Map<String, dynamic>> get allEvents {
    _$allEventsAtom.context.enforceReadPolicy(_$allEventsAtom);
    _$allEventsAtom.reportObserved();
    return super.allEvents;
  }

  @override
  set allEvents(List<Map<String, dynamic>> value) {
    _$allEventsAtom.context.conditionallyRunInAction(() {
      super.allEvents = value;
      _$allEventsAtom.reportChanged();
    }, _$allEventsAtom, name: '${_$allEventsAtom.name}_set');
  }

  final _$_EventsListModelActionController =
      ActionController(name: '_EventsListModel');

  @override
  void getEventName(int idx) {
    final _$actionInfo = _$_EventsListModelActionController.startAction();
    try {
      return super.getEventName(idx);
    } finally {
      _$_EventsListModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getEventDesc(int idx) {
    final _$actionInfo = _$_EventsListModelActionController.startAction();
    try {
      return super.getEventDesc(idx);
    } finally {
      _$_EventsListModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getEventCoverPhoto(int idx) {
    final _$actionInfo = _$_EventsListModelActionController.startAction();
    try {
      return super.getEventCoverPhoto(idx);
    } finally {
      _$_EventsListModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getEventVenuePhotos(int idx) {
    final _$actionInfo = _$_EventsListModelActionController.startAction();
    try {
      return super.getEventVenuePhotos(idx);
    } finally {
      _$_EventsListModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, dynamic> getEventDetails(int idx) {
    final _$actionInfo = _$_EventsListModelActionController.startAction();
    try {
      return super.getEventDetails(idx);
    } finally {
      _$_EventsListModelActionController.endAction(_$actionInfo);
    }
  }
}

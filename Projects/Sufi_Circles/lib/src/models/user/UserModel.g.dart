// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on _UserModel, Store {
  final _$nameAtom = Atom(name: '_UserModel.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_UserModel.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$isEmailVerifiedAtom = Atom(name: '_UserModel.isEmailVerified');

  @override
  bool get isEmailVerified {
    _$isEmailVerifiedAtom.context.enforceReadPolicy(_$isEmailVerifiedAtom);
    _$isEmailVerifiedAtom.reportObserved();
    return super.isEmailVerified;
  }

  @override
  set isEmailVerified(bool value) {
    _$isEmailVerifiedAtom.context.conditionallyRunInAction(() {
      super.isEmailVerified = value;
      _$isEmailVerifiedAtom.reportChanged();
    }, _$isEmailVerifiedAtom, name: '${_$isEmailVerifiedAtom.name}_set');
  }

  final _$countryAtom = Atom(name: '_UserModel.country');

  @override
  String get country {
    _$countryAtom.context.enforceReadPolicy(_$countryAtom);
    _$countryAtom.reportObserved();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.context.conditionallyRunInAction(() {
      super.country = value;
      _$countryAtom.reportChanged();
    }, _$countryAtom, name: '${_$countryAtom.name}_set');
  }

  final _$cityAtom = Atom(name: '_UserModel.city');

  @override
  String get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$_UserModelActionController = ActionController(name: '_UserModel');

  @override
  void setUserName(String name) {
    final _$actionInfo = _$_UserModelActionController.startAction();
    try {
      return super.setUserName(name);
    } finally {
      _$_UserModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserEmail(String email) {
    final _$actionInfo = _$_UserModelActionController.startAction();
    try {
      return super.setUserEmail(email);
    } finally {
      _$_UserModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailVerificationStatus(bool status) {
    final _$actionInfo = _$_UserModelActionController.startAction();
    try {
      return super.setEmailVerificationStatus(status);
    } finally {
      _$_UserModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserCountry(String country) {
    final _$actionInfo = _$_UserModelActionController.startAction();
    try {
      return super.setUserCountry(country);
    } finally {
      _$_UserModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserCity(String city) {
    final _$actionInfo = _$_UserModelActionController.startAction();
    try {
      return super.setUserCity(city);
    } finally {
      _$_UserModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllDetails(Map<String, dynamic> user) {
    final _$actionInfo = _$_UserModelActionController.startAction();
    try {
      return super.setAllDetails(user);
    } finally {
      _$_UserModelActionController.endAction(_$actionInfo);
    }
  }
}

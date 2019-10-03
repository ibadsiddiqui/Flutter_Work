// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginStates.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStates on _LoginStates, Store {
  final _$_userEmailAtom = Atom(name: '_LoginStates._userEmail');

  @override
  String get _userEmail {
    _$_userEmailAtom.context.enforceReadPolicy(_$_userEmailAtom);
    _$_userEmailAtom.reportObserved();
    return super._userEmail;
  }

  @override
  set _userEmail(String value) {
    _$_userEmailAtom.context.conditionallyRunInAction(() {
      super._userEmail = value;
      _$_userEmailAtom.reportChanged();
    }, _$_userEmailAtom, name: '${_$_userEmailAtom.name}_set');
  }

  final _$_passwordAtom = Atom(name: '_LoginStates._password');

  @override
  String get _password {
    _$_passwordAtom.context.enforceReadPolicy(_$_passwordAtom);
    _$_passwordAtom.reportObserved();
    return super._password;
  }

  @override
  set _password(String value) {
    _$_passwordAtom.context.conditionallyRunInAction(() {
      super._password = value;
      _$_passwordAtom.reportChanged();
    }, _$_passwordAtom, name: '${_$_passwordAtom.name}_set');
  }

  final _$_LoginStatesActionController = ActionController(name: '_LoginStates');

  @override
  void setUserEmail(String value) {
    final _$actionInfo = _$_LoginStatesActionController.startAction();
    try {
      return super.setUserEmail(value);
    } finally {
      _$_LoginStatesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserPassword(String value) {
    final _$actionInfo = _$_LoginStatesActionController.startAction();
    try {
      return super.setUserPassword(value);
    } finally {
      _$_LoginStatesActionController.endAction(_$actionInfo);
    }
  }
}

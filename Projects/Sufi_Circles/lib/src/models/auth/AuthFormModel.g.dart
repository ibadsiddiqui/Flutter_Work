// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthFormModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthModel on _AuthModel, Store {
  Computed<bool> _$canLoginComputed;

  @override
  bool get canLogin =>
      (_$canLoginComputed ??= Computed<bool>(() => super.canLogin)).value;
  Computed<Map<String, String>> _$authDetailsComputed;

  @override
  Map<String, String> get authDetails => (_$authDetailsComputed ??=
          Computed<Map<String, String>>(() => super.authDetails))
      .value;

  final _$emailAtom = Atom(name: '_AuthModel.email');

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

  final _$passwordAtom = Atom(name: '_AuthModel.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$userLoggedInAtom = Atom(name: '_AuthModel.userLoggedIn');

  @override
  bool get userLoggedIn {
    _$userLoggedInAtom.context.enforceReadPolicy(_$userLoggedInAtom);
    _$userLoggedInAtom.reportObserved();
    return super.userLoggedIn;
  }

  @override
  set userLoggedIn(bool value) {
    _$userLoggedInAtom.context.conditionallyRunInAction(() {
      super.userLoggedIn = value;
      _$userLoggedInAtom.reportChanged();
    }, _$userLoggedInAtom, name: '${_$userLoggedInAtom.name}_set');
  }

  final _$_AuthModelActionController = ActionController(name: '_AuthModel');

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_AuthModelActionController.startAction();
    try {
      return super.setEmail(email);
    } finally {
      _$_AuthModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_AuthModelActionController.startAction();
    try {
      return super.setPassword(password);
    } finally {
      _$_AuthModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoginStatus(bool loggedIn) {
    final _$actionInfo = _$_AuthModelActionController.startAction();
    try {
      return super.setLoginStatus(loggedIn);
    } finally {
      _$_AuthModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_AuthModelActionController.startAction();
    try {
      return super.validatePassword(value);
    } finally {
      _$_AuthModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_AuthModelActionController.startAction();
    try {
      return super.validateEmail(value);
    } finally {
      _$_AuthModelActionController.endAction(_$actionInfo);
    }
  }
}

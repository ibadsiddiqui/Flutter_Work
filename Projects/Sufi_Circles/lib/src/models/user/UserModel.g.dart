// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on _UserModel, Store {
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

  final _$_UserModelActionController = ActionController(name: '_UserModel');

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
}
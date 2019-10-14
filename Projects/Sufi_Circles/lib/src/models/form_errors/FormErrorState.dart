import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part "FormErrorState.g.dart";

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => !isNull(email) || !isNull(password);
}

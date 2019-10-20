import 'package:mobx/mobx.dart';

part 'UserModel.g.dart';

class UserModel = _UserModel with _$UserModel;

abstract class _UserModel with Store {
  @observable
  String email = '';

  @observable
  bool isEmailVerified = false;

  @action
  void setUserEmail(String email) => this.email = email;

  @action
  void setEmailVerificationStatus(bool status) => this.isEmailVerified = status;
}

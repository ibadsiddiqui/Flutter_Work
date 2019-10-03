import 'package:mobx/mobx.dart';

// Include generated file
part 'LoginStates.g.dart';

// This is the class used by rest of your codebase
class LoginStates = _LoginStates with _$LoginStates;

// The store-class
abstract class _LoginStates with Store {
  @observable
  String _userEmail = "";

  @observable
  String _password = "";

  String get userPassword => _password;
  String get userEmail => _userEmail;

  @action
  void setUserEmail(String value) {
    _userEmail = value;
  }

  @action
  void setUserPassword(String value) {
    _password = value;
  }
}

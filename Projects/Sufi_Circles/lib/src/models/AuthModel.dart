import 'package:mobx/mobx.dart';

// Include generated file
part 'AuthModel.g.dart';

// This is the class used by rest of your codebase
class AuthModel = _AuthModel with _$AuthModel;

// The store-class
abstract class _AuthModel with Store {
  @observable
  String username = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @action
  void setUsername(String username) => username = username;
  @action
  void setEmail(String email) => email = email;
  @action
  void setPassword(String password) => password = password;
}

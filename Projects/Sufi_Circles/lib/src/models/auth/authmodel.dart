import 'package:mobx/mobx.dart';

// Include generated file
part 'authmodel.g.dart';

// This is the class used by rest of your codebase
class AuthModel = _AuthModel with _$AuthModel;

// The store-class
abstract class _AuthModel with Store {

  @observable
  String email = "";

  @observable
  String password = "";

  @action
  void setEmail(String email) => email = email;
  @action
  void setPassword(String password) => password = password;
}

import 'package:mobx/mobx.dart';

part 'UserModel.g.dart';

class UserModel = _UserModel with _$UserModel;

abstract class _UserModel with Store {
  @observable
  String userID = '';

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  bool isEmailVerified = false;

  @observable
  String country = '';

  @observable
  String city = '';

  @action
  void setUserID(String userID) => this.userID = userID;

  @action
  void setUserName(String name) => this.name = name;

  @action
  void setUserEmail(String email) => this.email = email;

  @action
  void setEmailVerificationStatus(bool status) => this.isEmailVerified = status;

  @action
  void setUserCountry(String country) => this.country = country;

  @action
  void setUserCity(String city) => this.city = city;

  @action
  void setAllDetails(Map<String, dynamic> user) {
    setUserID(user["uid"] != null ? user["uid"] : "");
    setUserName(user["name"] != null ? user["name"] : "");
    setUserEmail(user["email"]);
    setUserCountry(user["country"] != null ? user["country"] : "");
    setUserCity(user["city"] != null ? user["city"] : "");
  }
}

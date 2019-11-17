import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/services/db/UserDBServices.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';

class UserDBController {
  UserDBServices _userDBServices = UserDBServices();

  createUserInDB(FirebaseUser user, AuthModel authModel) async {
    final String encryptedPassword = await encryptKey(authModel.password);
    Map<String, dynamic> userJson = {
      "uid": user.uid,
      "email": user.email,
      "password": encryptedPassword,
      "isEmailVerified": user.isEmailVerified,
      "creationTimeStamp": user.metadata.creationTime,
    };
    await _userDBServices.createUserInDB(userJson);
  }

  updateUserLastLogin(FirebaseUser user) async {
    Map<String, dynamic> userJson = {
      "uid": user.uid,
      "lastSignInTime": user.metadata.lastSignInTime,
    };
    await _userDBServices.updateUserLastLogin(userJson);
  }

  Future<void> setUserDetailsUsingID(context, String userID) async {
    try {
      Map<String, dynamic> data =
          await _userDBServices.getUserDetailsUsingID(userID);
      UserModel userModel = Provider.of<UserModel>(context);
      userModel.setAllDetails(data);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUserName(context) async {
    UserModel userModel = Provider.of<UserModel>(context);
    await _userDBServices.updateUserName(userModel.userID, userModel.name);
  }

  Future<void> updateUserEmail(context) async {
    UserModel userModel = Provider.of(context);
    await _userDBServices.updateUserEmail(userModel.userID, userModel.email);
  }

  Future<void> updateUserCountry(context) async {
    UserModel userModel = Provider.of(context);
    await _userDBServices.updateUserCountry(
        userModel.userID, userModel.country);
  }

  Future<void> updateUserCity(context) async {
    UserModel userModel = Provider.of(context);
    await _userDBServices.updateUserCity(userModel.userID, userModel.city);
  }
}

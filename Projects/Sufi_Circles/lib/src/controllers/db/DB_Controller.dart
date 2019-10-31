import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/services/db/UserDBServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class DBController {
  UserDBServices _userDBServices = UserDBServices();

  createUserInDB(FirebaseUser user) async {
    Map<String, dynamic> userJson = {
      "uid": user.uid,
      "email": user.email,
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

  Future<void> setUserDetailsUsingID(
      context, String userID) async {
    try {
      Map<String, dynamic> data =
          await _userDBServices.getUserDetailsUsingID(userID);
      UserModel userModel = Provider.of<UserModel>(context);
      userModel.setAllDetails(data);
    } catch (e) {
      throw e;
    }
  }
}

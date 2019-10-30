import 'package:Sufi_Circles/src/services/UserDBServices.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}

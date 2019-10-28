import 'package:Sufi_Circles/src/services/UserServices.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DB_Controller {
  UserServices _userServices = UserServices();

  db_createUser(FirebaseUser user) async {
    Map<String, dynamic> userJson = {
      "uid": user.uid,
      "email": user.email,
      "isEmailVerified": user.isEmailVerified,
      "creationTimeStamp": user.metadata.creationTime,
    };
    await _userServices.createUserInDB(userJson);
  }
}

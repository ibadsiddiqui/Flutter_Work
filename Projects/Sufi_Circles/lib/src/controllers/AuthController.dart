import 'package:Sufi_Circles/src/controllers/DB_Controller.dart';
import 'package:Sufi_Circles/src/services/AuthServices.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/popup/AuthPopups.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class AuthController extends ChangeNotifier {
  AuthService _authService = new AuthService();
  ShowPopUp _showPopUp = ShowPopUp();
  DBController _dbController = DBController();
  ShareUtils utils = ShareUtils();

  userSignIn(context, {Function toggle, Function resetPassword}) async {
    final authModel = Provider.of<AuthModel>(context);
    try {
      FirebaseUser _user = await _authService.userSignIn(authModel.authDetails);
      IdTokenResult userToken = await _user.getIdToken();
      utils.setUserTokenDetails(userToken);
      _dbController.updateUserLastLogin(_user);
      _showPopUp.showSuccessFulSigninPopUp(context);
      toggle();
      resetPassword();
    } on PlatformException catch (e) {
      resetPassword();
      toggle();
      authModel.setPassword("");
      _showPopUp.incorrectCredentials(context,
          title: replaceUnderscore(e.code), msg: e.message);
    }
  }

  userSignup(context, {Function toggle, Function resetPassword}) async {
    final authModel = Provider.of<AuthModel>(context);
    try {
      FirebaseUser user = await _authService.createUser(authModel.authDetails);
      _dbController.createUserInDB(user);
      toggle();
      _showPopUp.showSuccessFulSignupPopUp(context);
    } on PlatformException catch (e) {
      resetPassword();
      toggle();
      authModel.setPassword("");
      _showPopUp.showFailedSignupPopUp(e.code, e.message, context);
    }
  }
}

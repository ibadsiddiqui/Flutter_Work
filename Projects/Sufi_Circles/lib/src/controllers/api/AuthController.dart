import 'package:Sufi_Circles/src/controllers/db/UserDBController.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/services/api/AuthServices.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/popup/AuthPopups.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AuthController extends ChangeNotifier {
  AuthService _authService = new AuthService();
  ShowPopUp _showPopUp = ShowPopUp();
  UserDBController _userDBController = UserDBController();
  ShareUtils utils = ShareUtils();

  Future<void> userSignIn(context,
      {Function toggle, Function resetPassword}) async {
    final authModel = Provider.of<AuthModel>(context);
    try {
      FirebaseUser _user = await _authService.userSignIn(authModel.authDetails);
      await utils.setUserTokenDetails(_user);
      await _userDBController.updateUserLastLogin(_user);
      _showPopUp.showSuccessFulSigninPopUp(context, _user.uid);
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

  void userSignup(context, toggle, resetPassword) async {
    AuthModel authModel = Provider.of<AuthModel>(context);
    toggle();
    try {
      FirebaseUser user = await _authService.createUser(authModel.authDetails);
      await _userDBController.createUserInDB(user, authModel);
      toggle();
      _showPopUp.showSuccessFulSignupPopUp(context);
    } on PlatformException catch (e) {
      resetPassword();
      toggle();
      authModel.setPassword("");
      _showPopUp.showFailedSignupPopUp(
          replaceUnderscore(e.code), e.message, context);
    }
  }

  Future<void> updateFirebaseUserEmail(String newEmail, context) async {
    await _authService.updateFirebaseUserEmail(newEmail);
  }

  Future<void> signOutUser() async {
    await _authService.signOut();
  }
}

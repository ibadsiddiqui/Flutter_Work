import 'package:Sufi_Circles/src/services/AuthServices.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/popup/AuthPopups.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class AuthController extends ChangeNotifier {
  AuthService _authService = new AuthService();
  ShowPopUp showPopUp = ShowPopUp();

  userSignIn(context, {Function toggle, Function resetPassword}) async {
    try {
      FirebaseUser _user = await _authService
          .userSignIn(Provider.of<AuthModel>(context).authDetails);
      IdTokenResult userToken = await _user.getIdToken();
      showPopUp.showSuccessFulSigninPopUp(context);
      toggle();
      resetPassword();
    } on PlatformException catch (e) {
      resetPassword();
      toggle();
      Provider.of<AuthModel>(context).setPassword("");
      showPopUp.incorrectCredentials(context,
          title: replaceUnderscore(e.code), msg: e.message);
    }
  }
}
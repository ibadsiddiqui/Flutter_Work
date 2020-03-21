import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/widgets/popup/AuthPopups.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class ValidateAPIControllers {
  AuthController _authController = AuthController();
  ShowPopUp showPopUp = ShowPopUp();

  void validateLogin(context, {Function load, Function resetPass}) async {
    final authModel = Provider.of<AuthModel>(context);
    authModel.validateAll();
    if (authModel.canLogin) {
      load();
      await _authController.userSignIn(context,
          toggle: load, resetPassword: resetPass);
    } else {
      showPopUp.incorrectCredentials(context);
      resetPass();
      authModel.setPassword("");
    }
  }

  void validateSignup(context, {Function load, Function resetPass}) async {
    final authModel = Provider.of<AuthModel>(context);
    authModel.validateAll();
    if (authModel.canLogin) {
      load();
      _authController.userSignup(context,
          toggle: load, resetPassword: resetPass);
    } else {
      showPopUp.incorrectCredentials(context,
          msg: "Please enter details to Sign Up");
      authModel.setPassword("");
    }
  }
}

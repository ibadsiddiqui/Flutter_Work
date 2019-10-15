import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ShowPopUp {
  incorrectCredentials(context) {
    new Alert(
      context: context,
      type: AlertType.error,
      title: "Incorrect credentials",
      desc:
          "Your email or password is incorrect. Please enter correct details.",
      buttons: [
        DialogButton(
          child: Text(
            "Try again",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  showSuccessFulSignupPopUp(context) {
    new Alert(
      context: context,
      type: AlertType.success,
      title: "Signup Successful",
      desc: "You have successfully been registered. You can sign in now.",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () => pushLoginScreen(context),
          width: 120,
        )
      ],
    ).show();
  }

  showSuccessFulSigninPopUp(context) {
    new Alert(
      context: context,
      type: AlertType.success,
      title: "Signin Successful",
      desc: "You have successfully been signed in.",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  showFailedSignupPopUp(title, desc, context) {
    new Alert(
      context: context,
      type: AlertType.error,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            "Try again",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

showDialogForWrongName(context) {
  return new Alert(
    context: context,
    type: AlertType.warning,
    title: "Invalid Name",
    desc: "Please enter correct name to proceed",
    style: AlertStyle(
        animationType: AnimationType.grow,
        animationDuration: Duration(milliseconds: 500)),
    buttons: [
      DialogButton(
        child: Text("Try again", style: Theme.of(context).textTheme.body1),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}

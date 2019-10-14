import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ShowPopUp {
  ShowPopUp(BuildContext context,
      {AlertType type,
      String title = "",
      String desc = "",
      Function onPressed,
      String label}) {
    new Alert(
      context: context,
      type: type,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: onPressed,
          width: 120,
        )
      ],
    ).show();
  }
}

import 'package:Sufi_Circles/src/widgets/auth/AuthInput.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        AuthInput(
            label: "Email",
            validator: (String value) {},
            handleChange: (String value) {
              print(value);
            }),
        AuthInput(
          label: "Password",
          validator: (String value) {},
          handleChange: (String value) {},
          obsure: true,
        ),
      ],
    );
  }
}

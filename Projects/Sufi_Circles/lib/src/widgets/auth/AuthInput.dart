import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final Function validator;
  final Function handleChange;
  final bool obsure;
  final TextInputType keyboardType;

  const AuthInput(
      {Key key,
      this.label,
      this.validator,
      this.handleChange,
      this.obsure = false,
      this.keyboardType = TextInputType.emailAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
      child: new TextFormField(
        decoration: new InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 0.0,
            ),
          ), // focusColor: Colors.black,
          labelStyle: TextStyle(color: Colors.black),
          labelText: this.label,
          fillColor: Colors.black,
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        ),
        validator: this.validator,
        onChanged: this.handleChange,
        obscureText: this.obsure,
        keyboardType: this.keyboardType,
        style: new TextStyle(
          fontFamily: "Comfortaa",
          color: Colors.black,
        ),
      ),
    );
  }
}

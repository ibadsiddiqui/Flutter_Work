import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final Function validator;
  final Function handleChange;
  final bool obscure;
  final TextInputType keyboardType;
  final Icon icon;
  final String initialValue;
  const AuthInput(
      {Key key,
      this.label,
      this.validator,
      this.handleChange,
      this.obscure = false,
      this.keyboardType = TextInputType.emailAddress,
      this.icon,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.white, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: icon,
          ),
          new Expanded(
            child: TextFormField(
              validator: validator,
              obscureText: obscure,
              onChanged: handleChange,
              keyboardType: keyboardType,
              style: TextStyle(color: Colors.white),
              initialValue: initialValue,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

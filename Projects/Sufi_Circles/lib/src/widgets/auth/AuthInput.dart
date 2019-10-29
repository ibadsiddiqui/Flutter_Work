import 'package:flutter/material.dart';

class AuthInput extends StatefulWidget {
  final String label;
  final Function validator;
  final Function handleChange;
  final bool obscure;
  final TextInputType keyboardType;
  final Icon icon;
  final controller;
  const AuthInput({
    Key key,
    this.label,
    this.validator,
    this.handleChange,
    this.obscure = false,
    this.keyboardType = TextInputType.emailAddress,
    this.icon,
    this.controller,
  }) : super(key: key);

  @override
  _AuthInputState createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
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
            child: widget.icon,
          ),
          new Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              obscureText: widget.obscure,
              onChanged: widget.handleChange,
              keyboardType: widget.keyboardType,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.label,
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

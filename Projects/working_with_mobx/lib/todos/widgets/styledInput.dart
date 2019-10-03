import 'package:flutter/material.dart';

Widget styledInput(String intialValue, String label,
    Function handleChangedValue, TextInputType keyboardType,
    {bool secure = false}) {
  return new TextFormField(
    initialValue: intialValue,
    decoration: new InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: new BorderSide(),
      ),
      //fillColor: Colors.green
    ),
    validator: (val) {
      if (val.length == 0)
        return "Cannot be empty";
      else
        return null;
    },
    obscureText: secure,
    onChanged: (String value) {
      print(value);
      handleChangedValue(value);
    },
    keyboardType: keyboardType,
    style: new TextStyle(
      fontFamily: "Poppins",
    ),
  );
}

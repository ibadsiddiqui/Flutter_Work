import 'package:flutter/material.dart';

Widget authInput(String label, Function validator, Function handleChange) {
  return new TextFormField(
    decoration: new InputDecoration(
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 0.0,
        ),
      ), // focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      labelText: label,
      fillColor: Colors.white,
      prefixIcon: Icon(Icons.person,color: Colors.white,),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: new BorderSide(),
      ),
    ),
    validator: validator,
    onChanged: handleChange,
    keyboardType: TextInputType.text,
    style: new TextStyle(
      fontFamily: "Poppins",
      color: Colors.white,
    ),
  );
}

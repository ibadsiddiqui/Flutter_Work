import 'package:flutter/material.dart';

class EditDetailsField extends StatelessWidget {
  final String label;
  final Function edit;
  const EditDetailsField({Key key, this.label, this.edit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black, style: BorderStyle.solid),
        ),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          border: InputBorder.none,
          hasFloatingPlaceholder: true,
          alignLabelWithHint: true,
          labelText: label,
          labelStyle: TextStyle(fontSize: 20.0, fontFamily: "CreteRound"),
          hintMaxLines: 1,
          suffixIcon: IconButton(
            padding: EdgeInsets.only(top: 20, left: 20),
            tooltip: "Save",
            onPressed: edit,
            icon: Icon(Icons.save, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
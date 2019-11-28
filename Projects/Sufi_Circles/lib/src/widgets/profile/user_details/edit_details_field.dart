import 'package:flutter/material.dart';

class EditDetailsField extends StatelessWidget {
  final String label;
  final Function edit;
  final Function onSubmit;
  const EditDetailsField({Key key, this.label, this.edit, this.onSubmit})
      : super(key: key);

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
        onFieldSubmitted: onSubmit,
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.left,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: InputBorder.none,
          hasFloatingPlaceholder: true,
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.all(0),
          labelText: label,
          labelStyle: Theme.of(context).textTheme.subhead,
          hintMaxLines: 1,
          suffixIcon: IconButton(
            padding: EdgeInsets.only(top: 20, left: 20),
            tooltip: "Save",
            onPressed: edit,
            icon: Icon(Icons.close, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

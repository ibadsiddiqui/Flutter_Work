import 'package:flutter/material.dart';

class MultiLineInput extends StatelessWidget {
  final int maxLength;
  final int maxLines;
  final int minLines;
  final String hintText;

  const MultiLineInput(
      {Key key, this.maxLines, this.minLines, this.hintText, this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontFamily: "Comfortaa"),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 120),
          focusedBorder: InputBorder.none,
          hintText: hintText),
    );
  }
}

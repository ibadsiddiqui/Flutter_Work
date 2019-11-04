import 'package:Sufi_Circles/src/widgets/add_event_details/form/multiline_input.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';

class EventDetailForm extends StatelessWidget {
  final String hint;
  final String title;
  final TextEditingController controller;
  final Function onFieldSubmit;
  final int maxLine;
  final int minLines;
  final int maxLength;

  const EventDetailForm(
      {Key key,
      this.onFieldSubmit,
      this.controller,
      this.hint,
      this.title,
      this.maxLine,
      this.minLines,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 22.0,
              color: Color(0xFF072247),
              fontFamily: "CreteRound",
              fontWeight: FontWeight.bold,
            ),
          ),
          MultiLineInput(
            controller: controller,
            onFieldSubmit: onFieldSubmit,
            hintText: hint,
            maxLines: maxLine,
            minLines: minLines,
            maxLength: maxLength,
          ),
          RoundClippedButton(isMain: false, onPress: () {}),
        ],
      ),
    );
  }
}

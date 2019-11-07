import 'package:Sufi_Circles/src/widgets/add_event_details/form/form.dart';
import 'package:flutter/material.dart';

class AddEventOrganiserName extends StatefulWidget {
  final String inputHint;
  final String title;

  const AddEventOrganiserName({Key key, this.inputHint, this.title})
      : super(key: key);
  @override
  _AddEventOrganiserNameState createState() => _AddEventOrganiserNameState();
}

class _AddEventOrganiserNameState extends State<AddEventOrganiserName> {
  TextEditingController eventNameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return EventDetailForm(
      maxLength: 50,
      maxLine: 2,
      minLines: 1,
      controller: eventNameController,
      hint: widget.inputHint,
      onFieldSubmit: (String val) {},
      title: widget.title,
    );
  }
}

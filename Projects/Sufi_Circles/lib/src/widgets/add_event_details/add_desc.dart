import 'package:Sufi_Circles/src/widgets/add_event_details/form/form.dart';
import 'package:flutter/material.dart';

class AddEventDescDetail extends StatefulWidget {
  final String inputHint;
  final String title;

  const AddEventDescDetail({Key key, this.inputHint, this.title})
      : super(key: key);

  @override
  _AddEventDescDetailState createState() => _AddEventDescDetailState();
}

class _AddEventDescDetailState extends State<AddEventDescDetail> {
  TextEditingController eventNameController = TextEditingController(text: "");

  onNameSubmit(String name) {
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return EventDetailForm(
      maxLength: 500,
      maxLine: 15,
      minLines: 2,
      controller: eventNameController,
      hint: widget.inputHint,
      onFieldSubmit: onNameSubmit,
      title: widget.title,
    );
  }
}

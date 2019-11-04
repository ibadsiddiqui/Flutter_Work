import 'package:Sufi_Circles/src/widgets/add_event_details/form/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/event/EventModel.dart';

class AddEventNameDetail extends StatefulWidget {
  final String inputHint;
  final String title;

  const AddEventNameDetail({Key key, this.inputHint, this.title})
      : super(key: key);

  @override
  _AddEventNameDetailState createState() => _AddEventNameDetailState();
}

class _AddEventNameDetailState extends State<AddEventNameDetail> {
  TextEditingController eventNameController = TextEditingController(text: "");

  onNameSubmit(String name) {
    print("name");
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    EventModel eventModel = Provider.of<EventModel>(context);
    return EventDetailForm(
      maxLength: 75,
      maxLine: 3,
      minLines: 1,
      controller: eventNameController,
      hint: widget.inputHint,
      onFieldSubmit: onNameSubmit,
      title: widget.title,
    );
  }
}

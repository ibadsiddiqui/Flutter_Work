import 'package:Sufi_Circles/src/widgets/add_event_details/form/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/multiline_input.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';

class DetailForm extends StatefulWidget {
  @override
  _DetailFormState createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  TextEditingController eventNameController = TextEditingController(text: "");

  onNameSubmit(String name) {
    print("name");
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    EventModel eventModel = Provider.of<EventModel>(context);
    return EventDetailForm();
  }
}

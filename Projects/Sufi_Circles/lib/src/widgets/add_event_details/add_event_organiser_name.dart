import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/common/observer/observer.dart';
import 'package:Sufi_Circles/src/widgets/popup/dialog_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddEventOrganiserName extends StatefulWidget {
  final String title;
  final Function moveToNextPage;

  AddEventOrganiserName({Key key, this.title, this.moveToNextPage})
      : super(key: key);

  @override
  _AddEventOrganiserNameState createState() => _AddEventOrganiserNameState();
}

class _AddEventOrganiserNameState extends State<AddEventOrganiserName> {
  TextEditingController eventNameController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String name = Provider.of<EventModel>(context).organiserName.value;
    eventNameController = TextEditingController(text: name);
  }

  @override
  void dispose() {
    eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EventModel eventModel = Provider.of<EventModel>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormHeading(heading: widget.title),
          Container(
            child: TextField(
              style: Theme.of(context).textTheme.body2,
              onChanged: eventModel.setEventOrganiserName,
              autofocus: true,
              controller: eventNameController,
              decoration: InputDecoration(
                hintText: "Enter name here...",
                hintStyle: Theme.of(context).textTheme.body2,
              ),
            ),
          ),
          ObserveWidget(
            child: eventModel.organiserName.value != ""
                ? RoundClippedButton(
                    isMain: false,
                    onPress: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      bool isValid =
                          await validateName(eventNameController.text);
                      if (isValid)
                        widget.moveToNextPage();
                      else
                        showDialogForWrongName(context);
                    },
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

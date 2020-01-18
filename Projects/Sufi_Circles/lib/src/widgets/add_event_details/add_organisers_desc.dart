import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddOrganisersDetails extends StatefulWidget {
  final Function moveToNextPage;

  AddOrganisersDetails({Key key, this.moveToNextPage}) : super(key: key);
  @override
  _AddOrganisersDetailsState createState() => _AddOrganisersDetailsState();
}

class _AddOrganisersDetailsState extends State<AddOrganisersDetails> {
  @override
  Widget build(BuildContext context) {
    EventModel eventModel = Provider.of<EventModel>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FormHeading(heading: "Add Organiser's details. (optional)"),
            Observer(
              builder: (context) => Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      "Organiser's Email:",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    TextField(
                      onChanged: eventModel.setEventOrganiserEmail,
                      style: Theme.of(context).textTheme.body2,
                      decoration: InputDecoration(
                        hintText: "Enter here...",
                        hintStyle: Theme.of(context).textTheme.body2,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Organiser's Contact#:",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: eventModel.setEventOrganiserContact,
                      style: Theme.of(context).textTheme.body2,
                      decoration: InputDecoration(
                        hintText: "Enter here...",
                        hintStyle: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RoundClippedButton(isMain: false, onPress: widget.moveToNextPage),
          ],
        ),
      ),
    );
  }
}

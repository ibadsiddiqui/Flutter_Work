import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class AddTargettedAudienceLimit extends StatefulWidget {
  AddTargettedAudienceLimit({Key key}) : super(key: key);

  @override
  _AddTargettedAudienceLimitState createState() =>
      _AddTargettedAudienceLimitState();
}

class _AddTargettedAudienceLimitState extends State<AddTargettedAudienceLimit> {
  bool _noLimitToAudience = false;

  SingingCharacter _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormHeading(heading: "Describe your limit of audience?"),
          Row(
            children: <Widget>[
              Radio(
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              FlatButton(
                onPressed: () =>
                    setState(() => _character = SingingCharacter.lafayette),
                child: Text(
                  "No Limit.",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              FlatButton(
                onPressed: () =>
                    setState(() => _character = SingingCharacter.jefferson),
                child: Text(
                  "Limited.",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

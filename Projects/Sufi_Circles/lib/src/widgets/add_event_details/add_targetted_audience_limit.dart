import 'package:Sufi_Circles/src/models/event/MetaData.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/radio_button.dart';
import 'package:flutter/material.dart';

class AddTargettedAudienceLimit extends StatefulWidget {
  AddTargettedAudienceLimit({Key key}) : super(key: key);

  @override
  _AddTargettedAudienceLimitState createState() =>
      _AddTargettedAudienceLimitState();
}

class _AddTargettedAudienceLimitState extends State<AddTargettedAudienceLimit> {
  String _audienceLimit = UNLIMITED;
  String _limitRange = ZEROTO50;

  _setAudienceLimit(value) => this.setState(() => _audienceLimit = value);
  _setLimitingRange(value) => this.setState(() => _limitRange = value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormHeading(heading: "Describe your limit of audience?"),
          RadioButton(
            value: UNLIMITED,
            groupValue: _audienceLimit,
            onChanged: _setAudienceLimit,
            onPress: _setAudienceLimit,
          ),
          RadioButton(
            value: LIMITED,
            groupValue: _audienceLimit,
            onChanged: _setAudienceLimit,
            onPress: _setAudienceLimit,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: _audienceLimit == LIMITED
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RadioButton(
                        value: ZEROTO50,
                        groupValue: _limitRange,
                        onChanged: this._setLimitingRange,
                        onPress: this._setLimitingRange,
                      ),
                      RadioButton(
                        value: FIFTYTO100,
                        groupValue: _limitRange,
                        onChanged: this._setLimitingRange,
                        onPress: this._setLimitingRange,
                      ),
                      RadioButton(
                        value: HUNDREDTO500,
                        groupValue: _limitRange,
                        onChanged: this._setLimitingRange,
                        onPress: this._setLimitingRange,
                      ),
                      RadioButton(
                        value: FIVEHUNDREDTO1000,
                        groupValue: _limitRange,
                        onChanged: this._setLimitingRange,
                        onPress: this._setLimitingRange,
                      ),
                      RadioButton(
                        value: THOUSANDTO10000,
                        groupValue: _limitRange,
                        onChanged: this._setLimitingRange,
                        onPress: this._setLimitingRange,
                      ),
                      RadioButton(
                        value: TENTHOUSANDTO100000,
                        groupValue: _limitRange,
                        onChanged: this._setLimitingRange,
                        onPress: this._setLimitingRange,
                      ),
                    ],
                  )
                : null,
          )
        ],
      ),
    );
  }
}

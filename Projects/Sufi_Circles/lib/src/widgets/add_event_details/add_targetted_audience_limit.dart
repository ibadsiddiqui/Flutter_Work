import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/models/event/MetaData.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/radio_button.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/common/observer/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddTargettedAudienceLimit extends StatelessWidget {
  final Function moveToNextPage;

  AddTargettedAudienceLimit({Key key, this.moveToNextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventModel eventModel = Provider.of<EventModel>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ObserveWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormHeading(heading: "Describe the audience limit?*"),
            RadioButton(
              value: UNLIMITED,
              groupValue: eventModel.eventAudience.value,
              onChanged: eventModel.setEventAudience,
              onPress: eventModel.setEventAudience,
            ),
            RadioButton(
              value: LIMITED,
              groupValue: eventModel.eventAudience.value,
              onChanged: eventModel.setEventAudience,
              onPress: eventModel.setEventAudience,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: eventModel.eventAudience.value == LIMITED
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RadioButton(
                          value: ZEROTO50,
                          groupValue: eventModel.eventAudienceLimitRange.value,
                          onChanged: eventModel.setEventAudienceLimit,
                          onPress: eventModel.setEventAudienceLimit,
                        ),
                        RadioButton(
                          value: FIFTYTO100,
                          groupValue: eventModel.eventAudienceLimitRange.value,
                          onChanged: eventModel.setEventAudienceLimit,
                          onPress: eventModel.setEventAudienceLimit,
                        ),
                        RadioButton(
                          value: HUNDREDTO500,
                          groupValue: eventModel.eventAudienceLimitRange.value,
                          onChanged: eventModel.setEventAudienceLimit,
                          onPress: eventModel.setEventAudienceLimit,
                        ),
                        RadioButton(
                          value: FIVEHUNDREDTO1000,
                          groupValue: eventModel.eventAudienceLimitRange.value,
                          onChanged: eventModel.setEventAudienceLimit,
                          onPress: eventModel.setEventAudienceLimit,
                        ),
                        RadioButton(
                          value: THOUSANDTO10000,
                          groupValue: eventModel.eventAudienceLimitRange.value,
                          onChanged: eventModel.setEventAudienceLimit,
                          onPress: eventModel.setEventAudienceLimit,
                        ),
                        RadioButton(
                          value: TENTHOUSANDTO100000,
                          groupValue: eventModel.eventAudienceLimitRange.value,
                          onChanged: eventModel.setEventAudienceLimit,
                          onPress: eventModel.setEventAudienceLimit,
                        ),
                      ],
                    )
                  : null,
            ),
            RoundClippedButton(isMain: false, onPress: moveToNextPage),
          ],
        ),
      ),
    );
  }
}

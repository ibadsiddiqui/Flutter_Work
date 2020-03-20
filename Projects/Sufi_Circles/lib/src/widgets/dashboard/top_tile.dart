import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/event_details/event_details.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:flutter/material.dart';

class DashboardTopTile extends StatelessWidget {
  final Map event;

  DashboardTopTile({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: dashboardTopTabBackground(path: event['coverPhotoURL']),
        width: size.width * 0.45,
        height: size.width * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              truncateStrings(event['desc'], 20),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundClippedButton(
                  isMain: true,
                  child: Text("See Event",
                      style: Theme.of(context).textTheme.button),
                  onPress: () =>
                      pushScreen(context, screen: EventDetails(event: event))),
            )
          ],
        ),
      ),
    );
  }
}

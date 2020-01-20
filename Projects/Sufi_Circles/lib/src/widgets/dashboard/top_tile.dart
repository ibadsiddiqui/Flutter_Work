import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:flutter/material.dart';

class DashboardTopTile extends StatelessWidget {
  final String eventDesc;
  final String eventCoverPhoto;

  DashboardTopTile({Key key, this.eventDesc, this.eventCoverPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: dashboardTopTabBackground(path: eventCoverPhoto),
        width: size.width * 0.45,
        height: size.width * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              truncateStrings(eventDesc, 50),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundClippedButton(
                  isMain: true,
                  child: Text("Book Event",
                      style: Theme.of(context).textTheme.button),
                  onPress: () {}),
            )
          ],
        ),
      ),
    );
  }
}

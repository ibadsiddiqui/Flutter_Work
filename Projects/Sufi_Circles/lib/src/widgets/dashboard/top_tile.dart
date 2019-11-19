import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:flutter/material.dart';

class DashboardTopTile extends StatelessWidget {
  final String eventDesc;
  final String eventCoverPhoto;

  const DashboardTopTile({Key key, this.eventDesc, this.eventCoverPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: dashboardTopTabBackground(path: eventCoverPhoto),
        width: size.width * 0.45,
        height: size.width * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              eventDesc,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundClippedButton(
                  isMain: true,
                  child: Text(
                    "Book Event",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  onPress: () {}),
            )
          ],
        ),
      ),
    );
  }
}

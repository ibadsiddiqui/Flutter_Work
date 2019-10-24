import 'package:Sufi_Circles/src/widgets/named_circle/named_circle.dart';
import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  NamedCircle(size: "Large", title: "F"),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: NamedCircle(size: "Small", title: "F"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ibad Siddiqui",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Comforta",
                    ),
                  ),
                  Text(
                    "ibadsidiqui01@outloo.com",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Comforta",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

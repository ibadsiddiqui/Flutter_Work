import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/appbar.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/heading.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/top_tile.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isSearching = false;

  toggleSearch() => this.setState(() => isSearching = !isSearching);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DashboardDrawer(),
      appBar: dashboardAppBar(isSearching: isSearching, onPress: toggleSearch),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      DashboardTopTile(),
                      DashboardTopTile(),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      DashboardTopTile(),
                      DashboardTopTile(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DashboardHeadings(title: "Latest Events"),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: FlatButton(
                          onPressed: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              width: MediaQuery.of(context).size.width * 0.92,
                              height:
                                  MediaQuery.of(context).size.height * 0.225,
                              decoration: dashboardTopTabBackground(),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    width: "Nia Night Music Rapper"
                                            .length
                                            .toDouble() *
                                        20,
                                    child: Text(
                                      "Nia Night Music Rapper",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: "Nia Night Music Rapper"
                                            .length
                                            .toDouble() *
                                        10,
                                    child: Divider(
                                      color: Color(0xFFFC3C3C),
                                      thickness: 2,
                                      height: 1,
                                    ),
                                  ),
                                  Text(
                                    "asdjnasldnasdasildn asdnalsd asld nasnd as dasldaslk Nia Night Music Rapper",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontSize: 22.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: MediaQuery.of(context).size.height * 0.225,
                            decoration: dashboardTopTabBackground(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  width: "Nia Night Music Rapper"
                                          .length
                                          .toDouble() *
                                      20,
                                  child: Text(
                                    "Nia Night Music Rapper",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: "Nia Night Music Rapper"
                                          .length
                                          .toDouble() *
                                      10,
                                  child: Divider(
                                    color: Color(0xFFFC3C3C),
                                    thickness: 2,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  "asdjnasldnasdasildn asdnalsd asld nasnd as dasldaslk Nia Night Music Rapper",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontSize: 22.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

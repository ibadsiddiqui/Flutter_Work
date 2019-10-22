import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:flutter/material.dart';

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
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 10.0,
        backgroundColor: Color(0xFF072247),
        title: !isSearching
            ? TextFormField(
                autofocus: true,
                decoration: InputDecoration.collapsed(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                strutStyle: StrutStyle(),
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"),
              )
            : const Text(
                'Sufi Circles',
                style: TextStyle(fontFamily: "CreteRound"),
                textAlign: TextAlign.center,
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: toggleSearch,
          ),
          SizedBox(height: 10, width: 10)
        ],
      ),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: dashboardTopTabBackground(),
                          width: 175,
                          height: 175,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Come and Discover the cream of the crop",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Comfortaa",
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: FlatButton(
                                    // color: Color(0xFF072247),
                                    color: Colors.redAccent,
                                    onPressed: () {},
                                    child: Text(
                                      "Book Event",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "CreteRound",
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: dashboardTopTabBackground(),
                          width: 175,
                          height: 175,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Come and Discover the cream of the crop",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: dashboardTopTabBackground(),
                          width: 175,
                          height: 175,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Come and Discover the cream of the crop",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: dashboardTopTabBackground(),
                          width: 175,
                          height: 175,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Come and Discover the cream of the crop",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Latest Events",
                      style: TextStyle(
                        fontFamily: "CreteRound",
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
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

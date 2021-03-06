import 'package:Sufi_Circles/src/controllers/db/EventDBController.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/search_events/search_events.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/drawer/drawer.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/heading.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/lastest_events_tiles.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/top_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isSearching = false;
  EventDBController _eventDBController = EventDBController();

  @override
  void initState() {
    super.initState();
    //TODO: handle this
    _eventDBController.getLatestEventsSnap();
  }

  @override
  void dispose() => super.dispose();

  toggleSearch() => this.setState(() => isSearching = !isSearching);

  void _navigateTo(context, {Widget screen}) {
    // Navigator.pop(context);
    pushScreen(context, screen: screen);
  }

  Widget _buildHeader(List items, Size size) {
    return Container(
      height: size.height * 0.6,
      child: GridView.count(
        primary: false,
        physics: null,
        crossAxisCount: 2,
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
        crossAxisSpacing: MediaQuery.of(context).size.height * 0.015,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: _generateHeaderList(items),
      ),
    );
  }

  List<Widget> _generateHeaderList(List snapshot) {
    return List.generate(
        snapshot.length, (idx) => DashboardTopTile(event: snapshot[idx].data),
        growable: false);
  }

  Widget _buildBody(List snapshot) {
    return Column(
      children: List.generate(snapshot.length,
          (idx) => LatestEventTiles(snapshots: snapshot, index: idx)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DashboardDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF072247),
        title: DashboardHeadings(title: "Sufi Circles", color: Colors.white),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              tooltip: "Seach Events",
              onPressed: () => _navigateTo(context, screen: SearchEvents())),
          SizedBox(height: 10, width: 10)
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _eventDBController.getAllEvent(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Text('Loading', style: TextStyle(color: Colors.black)),
            );
          else {
            if (snapshot.data.documents.length == 0) {
              return Center(
                child: Text(
                  "Currently no events are happening around. Please try again later",
                  style: TextStyle(color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ),
              );
            } else
              return ListView(
                primary: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.5, bottom: 5.0),
                    child: DashboardHeadings(title: "Recommended Events"),
                  ),
                  _buildHeader(
                      reversedArray(snapshot.data.documents.take(4).toList()),
                      size),
                  Container(
                    margin: EdgeInsets.only(top: 2.5, bottom: 5.0),
                    child: DashboardHeadings(title: "Latest Events"),
                  ),
                  _buildBody(reversedArray(snapshot.data.documents)),
                ],
              );
          }
        },
      ),
    );
  }
}

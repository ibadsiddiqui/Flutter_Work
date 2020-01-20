import 'package:Sufi_Circles/src/controllers/db/EventDBController.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/appbar.dart';
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
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  toggleSearch() => this.setState(() => isSearching = !isSearching);

  Widget _buildHeader(List items, Size size) {
    return Container(
      height: size.height * 0.5,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
        crossAxisSpacing: MediaQuery.of(context).size.height * 0.015,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: _generateHeaderList(items),
      ),
    );
  }

  List<Widget> _generateHeaderList(List snapshot) {
    return List.generate(snapshot.length - 1, (idx) {
      String desc = (snapshot[idx])['desc'];
      String coverPhoto = (snapshot[idx])['coverPhotoURL'];
      return DashboardTopTile(eventDesc: desc, eventCoverPhoto: coverPhoto);
    }, growable: true);
  }

  Widget _buildBody(List snapshot, size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: size.height * 0.6,
      child: ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (_, idx) =>
              LatestEventTiles(snapshots: snapshot, index: idx)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: _eventDBController.getAllEvent(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Container(
            alignment: Alignment.center,
            child: new Text('Loading...'),
          );
        else
          return Scaffold(
            appBar: dashboardAppBar(context,
                isSearching: isSearching, onPress: toggleSearch),
            drawer: DashboardDrawer(),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.5, bottom: 5.0),
                  child: DashboardHeadings(title: "Recommended Events"),
                ),
                _buildHeader(snapshot.data.documents, size),
                Padding(
                  padding: const EdgeInsets.only(top: 2.5, bottom: 5.0),
                  child: DashboardHeadings(title: "Latest Events"),
                ),
                _buildBody(snapshot.data.documents, size),
              ],
            ),
          );
      },
    );
  }
}

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
    );
  }
}

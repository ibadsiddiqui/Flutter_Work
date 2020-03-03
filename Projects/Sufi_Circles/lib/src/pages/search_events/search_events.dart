import 'package:Sufi_Circles/src/controllers/db/EventDBController.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/heading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchEvents extends StatefulWidget {
  @override
  _SearchEventsState createState() => _SearchEventsState();
}

class _SearchEventsState extends State<SearchEvents> {
  EventDBController _eventDBController = EventDBController();
  TextEditingController _searchController = TextEditingController();

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF072247),
        title: DashboardHeadings(title: "Search Events", color: Colors.white),
      ),
      body: Container(
        child: new GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.black),
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (val) => this.setState(() => searchQuery = val),
                  decoration: InputDecoration(
                    hintText: 'Enter a search term',
                    contentPadding: EdgeInsets.only(top: 22.5),
                    hintStyle: TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                      padding: EdgeInsets.only(top: 15),
                      tooltip: "Clear",
                      onPressed: () => _searchController.clear(),
                      icon: Icon(Icons.close, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 100,
                child: StreamBuilder<QuerySnapshot>(
                    stream: _eventDBController.getAllEvent(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? Container()
                          : ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, idx) {
                                String name =
                                    (snapshot.data.documents[idx])['name'];
                                    // TODO:  fix tihs
                                return Text(name,
                                    style: TextStyle(color: Colors.black));
                              },
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

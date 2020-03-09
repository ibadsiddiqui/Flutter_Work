import 'package:Sufi_Circles/src/controllers/db/EventDBController.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
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
    final size = MediaQuery.of(context).size;
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
                margin: EdgeInsets.only(top: size.height * 0.05),
                height: size.height * 0.75,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _eventDBController.getAllEvent(),
                  builder: (context, snapshot) => !snapshot.hasData
                      ? Container()
                      : ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (_, idx) {
                            Map<String, dynamic> document =
                                reversedArray(snapshot.data.documents)[idx]
                                    .data;
                            return Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              height: 120,
                              width: double.maxFinite,
                              child: Card(
                                elevation: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      child: Image.network(
                                        document["coverPhotoURL"],
                                        width: size.width * 0.2,
                                        height: size.height * 0.1,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                        width: 100,
                                        child: Text(
                                          document["name"],
                                          style:
                                              Theme.of(context).textTheme.body2,
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

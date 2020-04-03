import 'package:Sufi_Circles/src/controllers/db/EventDBController.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/create_event/create_event.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/heading.dart';
import 'package:Sufi_Circles/src/widgets/events_list/events_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyEvents extends StatefulWidget {
  MyEvents({Key key}) : super(key: key);

  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  EventDBController _eventDBController = EventDBController();
  // TextEditingController _searchController = TextEditingController();

  List _getList(List<DocumentSnapshot> documents, String id) {
    return documents.where((DocumentSnapshot doc) {
      return doc["createdBy"] == id;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF072247),
        centerTitle: true,
        title: DashboardHeadings(title: "My Events", color: Colors.white),
      ),
      body: Container(
        margin: EdgeInsets.only(top: size.height * 0.05),
        height: size.height * 0.75,
        alignment: Alignment.center,
        child: StreamBuilder<QuerySnapshot>(
          stream: _eventDBController.getAllEvent(),
          builder: (_, snapshot) {
            if (!snapshot.hasData)
              return Container();
            else if (snapshot.data.documents.isEmpty)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "You haven't created any events yet. \nWould You like to create one?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  IconButton(
                    onPressed: () => pushScreen(context, screen: CreateEvent()),
                    icon: Icon(Icons.add, color: Colors.blueGrey),
                    iconSize: 50,
                    tooltip: "Add event",
                  )
                ],
              );
            else
              return EventsList(
                onLongPress: () {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text('Are you sure?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            'Archive',
                            style: TextStyle(color: Color(0xFF072247)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
                documents:
                    this._getList(snapshot.data.documents, userModel.userID),
              );
          },
        ),
      ),
    );
  }
}

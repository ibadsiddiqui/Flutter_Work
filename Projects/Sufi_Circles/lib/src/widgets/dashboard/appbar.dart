import 'package:Sufi_Circles/src/widgets/dashboard/heading.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget dashboardAppBar(context,
    {bool isSearching = false, Function onPress}) {
  return AppBar(
    centerTitle: true,
    elevation: 10.0,
    backgroundColor: Theme.of(context).backgroundColor,
    title: isSearching
        ? TextFormField(
            autofocus: isSearching,
            decoration: InputDecoration.collapsed(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.white),
            ),
            textAlign: TextAlign.center,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"),
          )
        : DashboardHeadings(title: "Sufi Circles", color: Colors.white),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          tooltip: "Seach Events",
          onPressed: onPress),
      SizedBox(height: 10, width: 10)
    ],
  );
}

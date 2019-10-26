import 'package:Sufi_Circles/src/widgets/dashboard/heading.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget dashboardAppBar(
    {bool isSearching = false, Function onPress}) {
  return AppBar(
    centerTitle: true,
    elevation: 10.0,
    backgroundColor: Color(0xFF072247),
    title: isSearching
        ? TextFormField(
            autofocus: isSearching,
            decoration: InputDecoration.collapsed(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.white),
            ),
            strutStyle: StrutStyle(),
            textAlign: TextAlign.center,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"),
          )
        : DashboardHeadings(
            title: "Sufi Circles",
          ),
    actions: <Widget>[
      IconButton(
        tooltip: "Seach Events",
        icon: Icon(Icons.search, color: Colors.white),
        onPressed: onPress,
      ),
      SizedBox(height: 10, width: 10)
    ],
  );
}

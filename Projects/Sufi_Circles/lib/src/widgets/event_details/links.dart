import 'package:Sufi_Circles/src/widgets/event_details/headings.dart';
import 'package:flutter/material.dart';

Widget _buildEventLinks(context, String link, String heading) {
  Widget child;
  if (link.isEmpty)
    child = null;
  else {
    child = FlatButton(
      onPressed: () => {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.adjust, color: Theme.of(context).primaryColor),
          buildSubHeadings(context, heading),
          Text(link, style: TextStyle(color: Colors.blueGrey))
        ],
      ),
    );
  }
  return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10), child: child);
}

Widget buildEventLinkSection(context, Map links) {
  List<Widget> linkLists = [];
  if (links["website"].toString().isNotEmpty)
    linkLists.add(_buildEventLinks(context, links["website"], "Website"));
  if (links["facebook"].toString().isNotEmpty)
    linkLists.add(_buildEventLinks(context, links["facebook"], "Facebook"));
  if (links["instagram"].toString().isNotEmpty)
    linkLists.add(_buildEventLinks(context, links["instagram"], "Instagram"));
  if (linkLists.isNotEmpty) linkLists.add(buildHeadings(context, "Links"));
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: linkLists,
  );
}

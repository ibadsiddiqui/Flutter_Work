import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/event_details/event_details.dart';
import 'package:Sufi_Circles/src/utils/date_helper.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/common/photos/load_photos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  final Function onLongPress;

  EventsList({Key key, this.documents, this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      primary: true,
      itemCount: documents.length,
      itemBuilder: (_, idx) {
        Map<String, dynamic> document = reversedArray(documents)[idx].data;
        String formattedDate =
            formatTimestamp((documents[idx])["dateFrom"]).toString();

        String startDate = formattedDate
            .substring(0, formattedDate.indexOf(" "))
            .replaceAll("-", "/");

        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          height: 120,
          child: Card(
            elevation: 5,
            child: InkWell(
              onLongPress: () => onLongPress(document["eventID"]),
              onTap: () =>
                  pushScreen(context, screen: EventDetails(event: document)),
              splashColor: Theme.of(context).backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        document["coverPhotoURL"],
                        gaplessPlayback: true,
                        fit: BoxFit.cover,
                        loadingBuilder: (_, child, progress) {
                          return progress == null
                              ? child
                              : Center(child: loadPhotos(progress));
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Name: ",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.body2,
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            Container(
                              child: Text(
                                (documents[idx])["name"],
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.body2,
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Date: ",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.body2,
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            Text(
                              startDate.replaceAll("about", ""),
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.body2,
                              textDirection: TextDirection.ltr,
                              // +
                              // " at " +
                              // startTime
                            ),
                          ],
                        ),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

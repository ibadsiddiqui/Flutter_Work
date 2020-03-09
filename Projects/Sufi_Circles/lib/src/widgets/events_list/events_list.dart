import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  EventsList({Key key, this.documents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (_, idx) {
        Map<String, dynamic> document = reversedArray(documents)[idx].data;
        return Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: 120,
          width: double.maxFinite,
          child: InkWell(
            onTap: () => print(document),
            splashColor: Theme.of(context).backgroundColor,
            child: Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
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
                        style: Theme.of(context).textTheme.body2,
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final Map<String, dynamic> event;

  EventDetails({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: size.height * 0.45,
              pinned: true,
              backgroundColor: Color(0xFF072247),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: HeroAnimation(photoPath: event["coverPhotoURL"]),
              ),
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.only(top: size.height * 0.125),
          child: new GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Column(
              children: <Widget>[
                Text(event["name"], style: Theme.of(context).textTheme.body2),
                Text(event["desc"], style: Theme.of(context).textTheme.body2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

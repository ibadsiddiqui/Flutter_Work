import 'package:Sufi_Circles/src/widgets/common/photos/load_photos.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';
import 'package:flutter/material.dart';

Widget buildPhotosList(context, {Widget heading, List photos}) {
  if (photos.isEmpty)
    return Container();
  else {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            heading,
            Container(
              margin: EdgeInsets.only(top: 15),
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: size.height * 0.3,
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length < 4 ? photos.length : photos.length - 3,
            itemBuilder: (context, int idx) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: InkWell(
                  onTap: () => HeroAnimation(photoPath: photos[idx]),
                  child: Image.network(
                    photos[idx],
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Loading.."),
                            loadPhotos(loadingProgress)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

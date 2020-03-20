import 'package:Sufi_Circles/src/widgets/common/photos/load_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap}) : super(key: key);

  final String photo;
  final VoidCallback onTap;

  Widget renderImage() {
    bool isHttpImage = photo.contains("https");
    if (isHttpImage)
      return Image.network(
        photo,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, progress) {
          return progress == null ? child : Center(child: loadPhotos(progress));
        },
      );
    else
      return Image.network(photo, fit: BoxFit.cover);
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isPlaceholder =
        photo.contains('asset/images/placeholder/cover/index.png');
    return SizedBox(
      width: size.width,
      child: Hero(
        tag: "profile_pic",
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: isPlaceholder
                ? Image.asset(photo, fit: BoxFit.cover)
                : renderImage(),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  final String photoPath;

  const HeroAnimation({Key key, this.photoPath}) : super(key: key);

  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 means normal animation speed.

    return Scaffold(
      body: Center(
        child: PhotoHero(
          photo: photoPath,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                body: Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: PhotoHero(
                    photo: photoPath,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

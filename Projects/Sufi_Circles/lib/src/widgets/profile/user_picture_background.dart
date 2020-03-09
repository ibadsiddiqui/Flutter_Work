import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap}) : super(key: key);

  final String photo;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Hero(
        tag: "profile_pic",
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: photo.contains('asset/images/placeholder/cover/index.png')
                ? Image.asset(photo, fit: BoxFit.cover)
                : Image.network(
                    photo,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
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

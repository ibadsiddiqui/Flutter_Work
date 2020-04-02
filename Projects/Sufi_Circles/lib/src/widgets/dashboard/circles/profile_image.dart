import 'package:Sufi_Circles/src/widgets/common/photos/load_photos.dart';
import 'package:flutter/material.dart';

class RoundProfileImage extends StatelessWidget {
  final String image;

  const RoundProfileImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 100,
        width: 100,
        child: Image.network(image, fit: BoxFit.cover,
            loadingBuilder: (_, child, progress) {
          return progress == null ? child : Center(child: loadPhotos(progress));
        }),
      ),
    );
  }
}

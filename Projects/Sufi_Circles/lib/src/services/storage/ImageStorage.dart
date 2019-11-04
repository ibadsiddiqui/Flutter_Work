import 'dart:io';

import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/services/db/UserDBServices.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageStorage {
  StorageReference storageRef = FirebaseStorage.instance.ref();
  UserDBServices userDBServices = UserDBServices();

  Future<String> uploadUserProfilePicture(
      String userID, String filePath) async {
    final StorageUploadTask uploadTask =
        storageRef.child("profile_pictures").child(userID).putFile(
              File(filePath),
              StorageMetadata(
                contentType: "image" + '/' + "jpg",
              ),
            );
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    userDBServices.updateUserProfilePicture(userID, url);
    return url;
  }
}

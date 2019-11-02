import 'dart:io';

import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/services/db/UserDBServices.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageStorage {
  StorageReference storageRef = FirebaseStorage.instance.ref();
  UserDBServices userDBServices = UserDBServices();

  Future<void> uploadUserProfilePicture(
      UserModel userModel, String filePath) async {
    final StorageUploadTask uploadTask =
        storageRef.child("profile_pictures").child(userModel.userID).putFile(
              File(filePath),
              StorageMetadata(
                contentType: "image" + '/' + "jpg",
              ),
            );
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    userModel.setUserProfilePic(url);
    userDBServices.updateUserProfilePicture(userModel.userID, url);
    return url;
  }
}

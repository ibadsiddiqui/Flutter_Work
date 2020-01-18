import 'dart:io';

import 'package:Sufi_Circles/src/services/db/UserDBServices.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ImageStorage {
  StorageReference storageRef = FirebaseStorage.instance.ref();
  UserDBServices userDBServices = UserDBServices();

  Future<String> uploadUserProfilePicture(userID, filePath) async {
    StorageUploadTask uploadTask =
        storageRef.child("users").child(userID).child(userID).putFile(
              File(filePath),
              StorageMetadata(
                  contentType: "image" + '/' + "jpg", contentLanguage: "en"),
            );
    StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    String url = (await downloadUrl.ref.getDownloadURL());
    userDBServices.updateUserProfilePicture(userID, url);
    return url;
  }

  Future<String> uploadEventPhoto(folder, eventID, filePath) async {
    StorageUploadTask uploadTask = storageRef
        .child("events")
        .child(eventID)
        .child(folder)
        .child(getFilename(filePath))
        .putFile(
          File(filePath),
          StorageMetadata(
              contentType: "image" + '/' + "jpg", contentLanguage: "en"),
        );
    StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    String url = (await downloadUrl.ref.getDownloadURL());
    return url;
  }
}

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FeedStorage {
  //Firebase storage instance
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //upload an image
  Future<String> uploadImage({required File postImage, required String userId}) async {
    final Reference ref = _firebaseStorage
        .ref()
        .child("feed-images")
        .child("$userId/${DateTime.now()}");

    try {
      //store the image under the reference
      final UploadTask _uploadTask = ref.putFile(
        postImage,
        SettableMetadata(contentType: "image/jpeg"),
      );

    //take the snapshot of uploaded file
    TaskSnapshot snapshot = await _uploadTask;

    final String imageUrl =  await snapshot.ref.getDownloadURL();

    return imageUrl;


    } catch (e) {
      print("image uplod error:$e");
      return "";
    }
  }
}

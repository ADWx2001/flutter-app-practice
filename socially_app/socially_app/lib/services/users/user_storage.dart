// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class UserProfileStorageService {
  //Firebase storage instance
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage({
    required File profileImage,
    required String userEmail,
  }) async {
    // Generate a unique path for each user's image
    String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
    Reference ref = _storage.ref().child("user-images/$userEmail/$fileName");

    try {
      // Upload file with metadata
      UploadTask task = ref.putFile(
        profileImage,
        SettableMetadata(
          contentType: 'image/jpeg', // You could dynamically infer content type
        ),
      );

      // Await task completion
      TaskSnapshot snapshot = await task;

      // Get the download URL for the uploaded image
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;

    } on FirebaseException catch (e) {
      // Handle Firebase-specific errors
      print('Firebase Exception: ${e.message}');
      return "";
    } catch (e) {
      // Handle other errors (e.g., network issues)
      print('General Exception: $e');
      return "";
    }
  }
}

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socially_app/models/post_model.dart';
import 'package:socially_app/services/feed/feed_storage.dart';
import 'package:socially_app/utils/functions/functions.dart';

class FeedService {
  //create collectioon reference
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("feeds");

  //save the post in the firestore databse
  Future<void> savePost(Map<String, dynamic> postDetails) async {
    try {
      String? postUrl;

      //check if the post has an image
      if (postDetails["postImage"] != null &&
          postDetails["postImage"] is File) {
        postUrl = await FeedStorage().uploadImage(
            postImage: postDetails["postImage"] as File,
            userId: postDetails["userId"] as String);
      }

      //Create the post object
      final Post newPost = Post(
        postId: "",
        postCaption: postDetails["postCaption"] as String? ?? "",
        mood: MoodExtension.fromString(postDetails["mood"] ?? "happy"),
        userId: postDetails["userid"] as String? ?? "",
        userName: postDetails["userName"] as String? ?? "",
        profileimage: postDetails["profImage"] as String? ?? "",
        likes: 0,
        datePublished: DateTime.now(),
        postUrl: postUrl ?? "",

      );

      //save the item to the firestore database
      final docRef = await _collectionReference.add(newPost.toJson());

      //save id come from the uplead and again update th id from doc ref
      await docRef.update({"postId": docRef.id});

      print("saved successfully");
    } catch (error) {
      print("Error saving post: $error");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socially_app/utils/functions/functions.dart';

class Post {
  final String postId;
  final String postCaption;
  final Mood mood;
  final String userId;
  final String userName;
  final String profileimage;
  final int likes;
  final DateTime datePublished;
  final String postUrl;

  Post({
    required this.postId,
    required this.postCaption,
    required this.mood,
    required this.userId,
    required this.userName,
    required this.profileimage,
    required this.likes,
    required this.datePublished,
    required this.postUrl,
  });

  //convert post instance to map to store firestore
  Map<String, dynamic> toJson() {
    return {
      "postId": postId,
      "postCaption": postCaption,
      "mood": mood.name,
      "userId": userId,
      "userName": userName,
      "profileimage": profileimage,
      "likes": likes,
      "datePublished": Timestamp.fromDate(datePublished),
      "postUrl": postUrl,
    };
  }

  //convert post to json comming from firestore
  factory Post.fromJson(Map<String, dynamic> data) {
    return Post(
      postId: data['postId'] ?? "",
      postCaption: data['postCaption'] ?? "",
      mood: data['mood'] ?? "",
      userId: data['userId'] ?? "",
      userName: data['userName'] ?? "",
      profileimage: data['profileimage'] ?? "",
      likes: data['likes'] ?? "",
      datePublished: (data['datePublished'] as Timestamp).toDate() ,
      postUrl: data['postUrl'] ?? "",
    );
  }
}

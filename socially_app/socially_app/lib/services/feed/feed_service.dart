import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socially_app/models/post_model.dart';
import 'package:socially_app/services/auth/auth_service.dart';
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
        userId: postDetails["userId"] as String? ?? "",
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


  // fetch the posts as stream
  Stream<List<Post>> getPostStream(){
    return _collectionReference.snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        return Post.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  } 

  //Delete Post 
  // Delete a post from the Firestore database
  Future<void> deletePost(
      {required String postId, required String postUrl}) async {
    try {
      await _collectionReference.doc(postId).delete();
      //await FeedStorage().deleteImage(imageUrl: postUrl);
      print("Post deleted successfully");
    } catch (error) {
      print('Error deleting post: $error');
    }
  }

  //get all posts images form the user
  Future<List<String>> getUserPosts(String userId) async {
    try {
      final userPosts = await _collectionReference
          .where('userId', isEqualTo: userId)
          .get()
          .then((snapshot) {
        return snapshot.docs.map((doc) {
          return Post.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
      });

      return userPosts.map((post) => post.postUrl).toList();
    } catch (error) {
      print('Error fetching user posts: $error');
      return [];
    }
  }


  //[ Here the like post methode will take two parameters the post id and the user id and it will add a document to the likes subcollection and update the likes count in the post document.]
  Future<void> likePost(
      {required String postId, required String userId}) async {
    try {
      final postLikesRef =
          _collectionReference.doc(postId).collection('likes').doc(userId);

      // Add a document to the likes subcollection
      await postLikesRef.set({'likedAt': Timestamp.now()});

      // Update the likes count in the post document
      final postDoc = await _collectionReference.doc(postId).get();
      final post = Post.fromJson(postDoc.data() as Map<String, dynamic>);
      final newLikesCount = post.likes + 1;

      await _collectionReference.doc(postId).update({'likes': newLikesCount});

      print('Post liked successfully');
      print(AuthService().getCurrentUser()!.uid);
      
    } catch (error) {
      print('Error liking post: $error');
    }
  }

  //create a methode to unlike a post
  // Unlike a post
  Future<void> unlikePost(
      {required String postId, required String userId}) async {
    try {
      final postLikesRef =
          _collectionReference.doc(postId).collection('likes').doc(userId);

      // Delete the document from the likes subcollection
      await postLikesRef.delete();

      // Update the likes count in the post document
      final postDoc = await _collectionReference.doc(postId).get();
      final post = Post.fromJson(postDoc.data() as Map<String, dynamic>);
      final newLikesCount = post.likes - 1;

      await _collectionReference.doc(postId).update({'likes': newLikesCount});

      print('Post unliked successfully');
    } catch (error) {
      print('Error unliking post: $error');
    }
  }

  // Check if a user has liked a post
  Future<bool> hasUserLikedPost(
      {required String postId, required String userId}) async {
    try {
      final postLikesRef =
          _collectionReference.doc(postId).collection('likes').doc(userId);

      // Check if the like document exists
      final doc = await postLikesRef.get();
      return doc.exists;
    } catch (error) {
      print('Error checking if user liked post: $error');
      return false;
    }
  }

  // Get the count of posts for a user
  Future<int> getUserPostsCount(String userId) async {
    try {
      final snapshot =
          await _collectionReference.where('userId', isEqualTo: userId).get();
      return snapshot.size;
    } catch (error) {
      print('Error getting user posts count: $error');
      return 0;
    }
  }


}

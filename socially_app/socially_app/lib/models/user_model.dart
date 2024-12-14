import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;
  final String jobTitle;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String password;
  final int followers;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.jobTitle,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.password,
    required this.followers,
  });

  //convert user instance to map(for save in to firestore)
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "jobTitle": jobTitle,
      "imageUrl": imageUrl,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "password": password,
      "followers": followers
    };  
  }

  //create user object json to dartObj
  factory UserModel.fromJson(Map<String, dynamic> data){
    return UserModel(
      userId: data["userId"]?? "", 
      name: data["name"]?? "", 
      email: data["email"]?? "", 
      jobTitle: data["jobTitle"]?? "", 
      imageUrl: data["imageUrl"]?? "", 
      createdAt: (data["createdAt"] as Timestamp).toDate(), 
      updatedAt:( data["updatedAt"] as Timestamp).toDate(), 
      password: data["password"]?? "", 
      followers: data["followers"]?? 0, 
    );
  }

}

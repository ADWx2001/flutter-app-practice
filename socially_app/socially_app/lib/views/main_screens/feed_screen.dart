
import 'package:flutter/material.dart';
import 'package:socially_app/models/post_model.dart';
import 'package:socially_app/services/feed/feed_service.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FeedService().getPostStream(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }if(snapshot.hasError){
            print(snapshot.toString());
            return const Center(
              child: Text("Failed to fetch posts"),
            );
          }if(!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(
              child: Text("No post availabel to show"),
            );
          }


          final List<Post> posts = snapshot.data!;


          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return Column(
                children: [
                  Text(post.postCaption)
                ],
              );
            },
          );
        },
      ),
    );
  }
}

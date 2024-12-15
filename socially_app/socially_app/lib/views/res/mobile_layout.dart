import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/views/auth_views/login.dart';
import 'package:socially_app/views/main_screen.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child:CircularProgressIndicator() ,
          );
        }else if (snapshot.hasData){
          return const MainScreen();
        }else{
          return LoginScreen();
        }
      },
    );
  }
}

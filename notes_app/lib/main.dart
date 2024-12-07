import 'package:flutter/material.dart';
import 'package:notes_app/utils/router.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
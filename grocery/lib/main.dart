import 'package:flutter/material.dart';
import 'package:grocery/pages/my_home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter shopping App',
      home: MyHome(),
    );
  }
}
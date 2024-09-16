import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: 300,
            height: 300,
            margin: EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: const Center(
              child: Text("Flutter container")
            ),
          ),
        ),
      ),
    );
  }
}
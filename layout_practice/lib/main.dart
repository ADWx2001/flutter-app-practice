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
            color: Colors.yellow,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello world"),
                Text("data"),
                Icon(Icons.access_alarm)
              ],
            ),
          ) 
        ),
      ),
    );
  }
}
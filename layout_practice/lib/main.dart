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
          body: Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: List.empty(growable: true),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text("Flutter container",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
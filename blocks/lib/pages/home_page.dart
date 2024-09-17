import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color:Colors.white ,
        ),
        title: const Text('Flutter Blocks App', 
        style: TextStyle(
          color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple[700],
      ),
    );
  }
}
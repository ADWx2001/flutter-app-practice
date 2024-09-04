import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('I am poor'),
        backgroundColor: Colors.lightGreen.shade600,
      ),
      backgroundColor: Colors.green.shade200,
      body: const Center(
        child: Image(
          image: AssetImage('images/i_am_poor.png')
          ),
      ), 
    ),
  ));
}


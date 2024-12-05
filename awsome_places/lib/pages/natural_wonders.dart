import 'package:flutter/material.dart';

class NaturalWonders extends StatelessWidget {
  const NaturalWonders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Natural Wonders',
          style: TextStyle(
            fontSize: 25,
            color: Colors.green[700],
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp( //material app is design system otherone is cupertino => aligns with ijhone ad macoss
    home: Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("I am Rich"),
        backgroundColor: Colors.blueAccent[200],
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/i_am_rich_app_icon.png')
          ),
      )
    )
  ));
}


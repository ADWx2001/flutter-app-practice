import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp( //material app is design system otherone is cupertino => aligns with ijhone ad macoss
    home: Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("I am Pakaya"),
        backgroundColor: Colors.blueAccent[200],
      ),
      body: const Center(
        child: Image(
          image: NetworkImage('https://st3.depositphotos.com/1005145/15351/i/450/depositphotos_153516954-stock-photo-summer-landscape-with-flowers-in.jpg')
          ),
      )
    )
  ));
}


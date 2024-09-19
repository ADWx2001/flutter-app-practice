import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.map_rounded),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: TextStyle(
                fontSize: 12, 
                color: Colors.grey,
                ),
            ),
            Text("Address goes here", 
            style: TextStyle(
              fontSize: 15, 
              color: Colors.black, 
              fontWeight: FontWeight.bold),
              ),
          ],
        ),
        actions: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.orange,
            ),
            child: Icon(
              Icons.shopping_bag,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}

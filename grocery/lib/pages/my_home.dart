import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Icon(
                color: Colors.white,
                Icons.location_on,
              ),
            ),
          ),
        ),
        title: Align(
          alignment: Alignment.centerLeft, // Aligns the content to the left
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns children within the Column
            children: const [
              Text("Delivery Address", style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),),
              Text("Location Goes here!", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
            ],
          ),
        ),
        actions: [
          Padding(
          padding: const EdgeInsets.only(right:5.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Icon(
                color: Colors.white,
                Icons.shopping_bag,
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}

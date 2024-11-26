import 'package:flutter/material.dart';

//AppBar Leading
Widget appBarLeading = Padding(
  padding: const EdgeInsets.all(5.0),
  child: Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xff9e00ff)),
    child: const Center(
      child: Icon(
        Icons.location_pin,
        color: Colors.white,
      ),
    ),
  ),
);

//AppBar Title
Widget appBarTitle = const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Delivery Address',
      style: TextStyle(
        fontSize: 16, 
        color: Colors.grey),
    ),
    Text(
      'Home',
      style: TextStyle(
          fontSize: 20, 
          color: Colors.black, 
          fontWeight: FontWeight.w500),
    ),
  ],
);

//AppBar Actions
List<Widget>? appBaractions = [
  Padding(
    padding: const EdgeInsets.only(right: 3),
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xff9e00ff)),
      child: const Center(
        child: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
    ),
  )
];

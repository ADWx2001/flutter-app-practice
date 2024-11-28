import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
const ProductCard({
  super.key, 
  required this.title, 
  required this.description, 
  required this.textColor, 
  required this.backgroundColor, 
  required this.boxColor
  });

  final String title;
  final String description;
  final Color textColor;
  final Color backgroundColor;
  final Color boxColor;
  final double cardHeight = 200;
  final double cardWidth = 190;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500, 
                color: textColor
                ),
              ),
                
              Text(
                description,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400, 
                color: textColor
                ),
              ),
                
              Container(
                height: 70,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: boxColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
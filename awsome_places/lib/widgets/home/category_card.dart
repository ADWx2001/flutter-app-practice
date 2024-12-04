import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final Color bgColor;
  final double width;

  const CategoryCard({
    super.key,
    required this.category,
    required this.bgColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center( // Centers the child widget
        child: Text(
          category,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center, // Ensures multiline text is centered
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_styles.dart';

class MainScreenToDoCard extends StatelessWidget {
  final String toDoTitle;
  final String formattedDate; // Expect formatted date
  final String formattedTime; // Expect formatted time
  final bool isDone;

  const MainScreenToDoCard({
    Key? key,
    required this.toDoTitle,
    required this.formattedDate,
    required this.formattedTime,
    required this.isDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.aCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16.0), // Adjust padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toDoTitle,
                  style: AppTextStyles.appDescription.copyWith(
                    fontWeight: FontWeight.w400, // Adjust font size as needed
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$formattedDate $formattedTime',
                  style: AppTextStyles.appDescriptionSmall.copyWith(
                    color: AppColors.aBgColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isDone ? Icons.done_all_outlined : Icons.done_outlined,
            color: isDone ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}

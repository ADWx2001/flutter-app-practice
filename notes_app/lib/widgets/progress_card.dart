import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/text_styles.dart';

class ProgressCard extends StatefulWidget {
  final int completedTasks;
  final int totalTasks;
  const ProgressCard({
    super.key, 
    required this.completedTasks, 
    required this.totalTasks
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  final appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.aDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.aCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const Text(
                "Today's Progress", 
                style: AppTextStyles.appSubtitle
              ),
              Text(
                " You have completed ${widget.completedTasks} out of ${widget.totalTasks}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.aWhiteColor,
                  
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.aFabColor,
            ),
            child: Center(
              child: Text(
                "${((widget.completedTasks/widget.totalTasks)*100).toInt()}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.aWhiteColor,
                  fontSize: 18
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
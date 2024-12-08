import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_styles.dart';

class TodayProgress extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  
  const TodayProgress({
    super.key, 
    required this.title, 
    required this.date, 
    required this.time
  });

  @override
  State<TodayProgress> createState() => _TodayProgressState();
}

class _TodayProgressState extends State<TodayProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.width*0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.aCardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.appSubtitle,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.29,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.date,
                    style: AppTextStyles.appDescriptionSmall.copyWith(
                      color: AppColors.aWhiteColor.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    widget.time,
                    style: AppTextStyles.appDescriptionSmall.copyWith(
                      color: AppColors.aWhiteColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
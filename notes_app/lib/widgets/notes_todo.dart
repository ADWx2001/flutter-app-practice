import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_styles.dart';

class NotesTodo extends StatefulWidget {
  final String title;
  final IconData iconName;
  final String description;

  const NotesTodo({
    super.key, 
    required this.title, 
    required this.iconName, 
    required this.description
  });

  @override
  State<NotesTodo> createState() => _NotesTodoState();
}

class _NotesTodoState extends State<NotesTodo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.42,
      height: MediaQuery.of(context).size.width*0.42,
      decoration: BoxDecoration(
        color: AppColors.aCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.iconName,
            size: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: AppTextStyles.appDescriptionSmall.copyWith(
              color: AppColors.aWhiteColor.withOpacity(0.5)
            ),
          ),

          Text(
            widget.description,
            style: AppTextStyles.appDescriptionSmall.copyWith(
              color: AppColors.aWhiteColor.withOpacity(0.5)
            ),
          ),
        ],
      ),
    );
  }
}
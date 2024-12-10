import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleNotePage extends StatelessWidget {
  final Note note;
  const SingleNotePage({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    // Format the date
    final formattedDate = DateFormat.yMMMd().format(note.date);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.aDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              note.title,
              style: AppTextStyles.appTitle,
            ),
            const SizedBox(height: 5),
            Text(
              formattedDate,
              style: AppTextStyles.appDescriptionSmall.copyWith(
                color: AppColors.aFabColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              note.content,
              style: AppTextStyles.appDescription.copyWith(
                color: AppColors.aWhiteColor.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
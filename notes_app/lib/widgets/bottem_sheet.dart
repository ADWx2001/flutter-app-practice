import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';

class CategoryInputBottomSheet extends StatefulWidget {
  final Function() onNewNote;
  final Function() onNewCategory;

  const CategoryInputBottomSheet(
      {super.key, required this.onNewNote, required this.onNewCategory});

  @override
  State<CategoryInputBottomSheet> createState() =>
      _CategoryInputBottomSheetState();
}

class _CategoryInputBottomSheetState extends State<CategoryInputBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.5,
      decoration: BoxDecoration(
        color: AppColors.aCardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add new note"),
              Icon(Icons.arrow_right)
            ],
          )
        ],
      ),
    );
  }
}

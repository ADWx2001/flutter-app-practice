import 'package:flutter/material.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/utils/text_styles.dart';

class CompletedTab extends StatefulWidget {
  final List<ToDo> completedToDOs;
  
  const CompletedTab({super.key, required this.completedToDOs});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Completed tab", style: AppTextStyles.appBody,),
    );
  }
}
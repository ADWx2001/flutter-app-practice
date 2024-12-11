import 'package:flutter/material.dart';
import 'package:notes_app/utils/text_styles.dart';

class ToDoTab extends StatefulWidget {
  const ToDoTab({super.key});

  @override
  State<ToDoTab> createState() => _ToDoTabState();
}

class _ToDoTabState extends State<ToDoTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("To Do Tab", style: AppTextStyles.appBody,),
    );
  }
}
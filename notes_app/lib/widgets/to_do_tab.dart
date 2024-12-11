import 'package:flutter/material.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/utils/text_styles.dart';

class ToDoTab extends StatefulWidget {
  final List<ToDo> incompletedToDos;
  const ToDoTab({super.key, required this.incompletedToDos});

  @override
  State<ToDoTab> createState() => _ToDoTabState();
}

class _ToDoTabState extends State<ToDoTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "To Do Tab",
        style: AppTextStyles.appBody,
      ),
    );
  }
}

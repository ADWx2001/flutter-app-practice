import 'package:flutter/material.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/completed_tab.dart';
import 'package:notes_app/widgets/to_do_card.dart';

class ToDoTab extends StatefulWidget {
  final List<ToDo> incompletedToDos;
  const ToDoTab({super.key, required this.incompletedToDos});

  @override
  State<ToDoTab> createState() => _ToDoTabState();
}

class _ToDoTabState extends State<ToDoTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final ToDo todo = widget.incompletedToDos[index];
                return TodoCard(toDo: todo, isComplete: false,);
              },
              itemCount: widget.incompletedToDos.length,
            ),
          )
        ],
      ),
    );
  }
}

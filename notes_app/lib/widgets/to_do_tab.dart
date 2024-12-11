import 'package:flutter/material.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/services/todo_service.dart';
import 'package:notes_app/utils/router.dart';
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
  void _markToDoasDone(ToDo todo) async {
    try {
      final ToDo updatedToDo = ToDo(
        title: todo.title,
        time: todo.time,
        isDone: true,
        date: todo.date,
      );
      await TodoService().markAsDone(updatedToDo);

      //show snack bar
      AppHelpers.showSnackBar(context, "marked as completed");
      setState(() {
        widget.incompletedToDos.remove(todo);
      });

      AppRouter.router.go("/todos");

    } catch (e) {
      print(e.toString());
    }
  }

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
                return TodoCard(
                  toDo: todo,
                  isComplete: false,
                  onCheckBoxChanged: () {_markToDoasDone(todo);},
                );
              },
              itemCount: widget.incompletedToDos.length,
            ),
          )
        ],
      ),
    );
  }
}

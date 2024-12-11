import 'package:flutter/material.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/services/todo_service.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/to_do_card.dart';

class CompletedTab extends StatefulWidget {
  final List<ToDo> completedToDOs;
  final List<ToDo> incompletedToDos;
  
  const CompletedTab({super.key, required this.completedToDOs, required this.incompletedToDos});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  void _markToDoasUnDone(ToDo todo) async {
    try {
      final ToDo updatedToDo = ToDo(
        title: todo.title,
        time: todo.time,
        isDone: true,
        date: todo.date,
      );
      await TodoService().markAsunDone(updatedToDo);

      //show snack bar
      setState(() {
        widget.completedToDOs.remove(todo);
        widget.incompletedToDos.add(todo);
      });
      AppHelpers.showSnackBar(context, "marked as incompleted");

      AppRouter.router.go("/todos");

    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.completedToDOs.sort((a, b) => a.time.compareTo(b.time));
    });
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
                final ToDo todo = widget.completedToDOs[index];
                return Dismissible(
                  key: Key(todo.id.toString()),
                  onDismissed: (direction) => {
                    setState(() {
                      widget.completedToDOs.removeAt(index);
                      TodoService().deleteToDo(todo);
                    }),
                    AppHelpers.showSnackBar(context, "Suuccessfully removed the task")
                  },

                  child: TodoCard(
                    toDo: todo,
                    isComplete: false,
                    onCheckBoxChanged: () {_markToDoasUnDone(todo);},
                  ),
                );
              },
              itemCount: widget.completedToDOs.length,
            ),
          )
        ],
      ),
    );
  }
}
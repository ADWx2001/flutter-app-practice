import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/services/note_servies.dart';
import 'package:notes_app/services/todo_service.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/notes_todo.dart';
import 'package:notes_app/widgets/progress_card.dart';
import 'package:notes_app/widgets/today_progress.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> allNotes = [];
  List<ToDo> allToDos = [];

  @override
  void initState() {
    super.initState();
    _checkIfUserIsNew();
  }

  void _checkIfUserIsNew() async {
    final bool isNewUser =
        await NoteServies().isFirstTime() || await TodoService().isNewUser();

    if (isNewUser) {
      await NoteServies().createInitialNotes();
      await TodoService().createInitialTodos();
    }
    _loadNotes();
    _loadToDos();
  }

  Future<void> _loadNotes() async {
    final List<Note> loadedNotes = await NoteServies().loadNotes();
    setState(() {
      allNotes = loadedNotes;
    });
  }

  Future<void> _loadToDos() async {
    final List<ToDo> loadedToDos = await TodoService().loadTodos();
    setState(() {
      allToDos = loadedToDos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: AppTextStyles.appTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (allToDos.isNotEmpty)
                ProgressCard(
                  completedTasks: allToDos.where((todo) => todo.isDone).length,
                  totalTasks: allToDos.length,
                ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppRouter.router.push("/notes");
                    },
                    child: NotesTodo(
                      title: 'Notes',
                      description: "${allNotes.length}",
                      iconName: Icons.bookmark_add,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppRouter.router.push("/todos");
                    },
                    child: NotesTodo(
                      title: 'To Do',
                      description: "${allToDos.length}",
                      iconName: Icons.calendar_month_sharp,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Progress",
                    style: AppTextStyles.appSubtitle,
                  ),
                  Text(
                    "See more",
                    style: AppTextStyles.appButton,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...allToDos.map((todo) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: MainScreenToDoCard(
                    toDoTitle: todo.title,
                    date: todo.date.toString(), // Pass the DateTime directly
                    isDone: todo.isDone,
                    time: todo.time.toString(),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

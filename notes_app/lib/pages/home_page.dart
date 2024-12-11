import 'package:flutter/material.dart';
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
  List<Note> allnotes = [];
  List<ToDo> allToDos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfUserIsNew();
    setState(() {
      
    });
  }

  void _checkIfUserIsNew() async{
    final bool isNewUser = 
    await NoteServies().isFirstTime() || await TodoService().isNewUser();

    if(isNewUser){
      await NoteServies().createInitialNotes();
      await TodoService().createInitialTodos();
    }
    _loadNotes();
    _loadToDos();
  }

  Future<void> _loadNotes() async{
    final List<Note> loadedNotes = await NoteServies().loadNotes();
    setState(() {
      allnotes = loadedNotes;
    });
  }

  Future<void> _loadToDos() async{
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
        child: Column(
          children: [
            const ProgressCard(completedTasks: allToDos.where((todo)=>todo.isDone).length, totalTasks: allToDos.length,),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRouter.router.push("/notes");
                  },
                  child: const NotesTodo(
                    title: 'To Do',
                    description: "2",
                    iconName: Icons.bookmark_add,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppRouter.router.push("/todos");
                  },
                  child: const NotesTodo(
                    title: 'To Do',
                    description: "2",
                    iconName: Icons.calendar_month_sharp,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
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
            const SizedBox(
              height: 10,
            ),
            const MainScreenToDoCard(
              toDoTitle: "Walking street",
              date: "",
              time: "09.12.11",
              isDone: true,
            ),
          ],
        ),
      ),
    );
  }
}

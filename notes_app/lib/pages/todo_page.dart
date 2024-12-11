import 'package:flutter/material.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/services/todo_service.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/completed_tab.dart';
import 'package:notes_app/widgets/to_do_tab.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TodoService toDoService = TodoService();
  late List<ToDo> allToDos = [];
  late List<ToDo> completedToDos = [];
  late List<ToDo> incompletedToDos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfUserIsNew();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _checkIfUserIsNew() async {
  try {
    final bool isNewUser = await toDoService.isNewUser();
    print('Is new user: $isNewUser');
    if (isNewUser) {
      print('Creating initial todos');
      await toDoService.createInitialTodos();
    }
    print('Loading todos');
    _loadToDos();
  } catch (e) {
    print('Error in _checkIfUserIsNew: $e');
  }
}

// Method to load the todos into the state
Future<void> _loadToDos() async {
  try {
    final List<ToDo> _loadedToDOs = await toDoService.loadTodos(); // Await the result
    if (!mounted) return; // Ensure the widget is still in the widget tree
    setState(() {
      allToDos = _loadedToDOs;
      incompletedToDos = allToDos.where((todo) => !todo.isDone).toList();
      completedToDos = allToDos.where((todo) => todo.isDone).toList(); // Fix condition
    });
  } catch (e) {
    print('Error loading todos: $e'); // Debugging log
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: const [
            Tab(
              child: Text(
                "ToDo",
                style: AppTextStyles.appDescription,
              ),
            ),
            Tab(
              child: Text(
                "Completed",
                style: AppTextStyles.appDescription,
              ),
            )
          ],
          controller: _tabController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            color: AppColors.aWhiteColor,
            width: 2,
          ),
        ),
        child: Icon(
          Icons.add,
          color: AppColors.aWhiteColor,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ToDoTab(
            incompletedToDos: incompletedToDos,
          ), 
          CompletedTab(
            completedToDOs: completedToDos,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';
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
  TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkIfUserIsNew();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _taskController.dispose();
    super.dispose();
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
      final List<ToDo> _loadedToDOs =
          await toDoService.loadTodos(); // Await the result
      if (!mounted) return; // Ensure the widget is still in the widget tree
      setState(() {
        allToDos = _loadedToDOs;
        incompletedToDos = allToDos.where((todo) => !todo.isDone).toList();
        completedToDos =
            allToDos.where((todo) => todo.isDone).toList(); // Fix condition
      });
    } catch (e) {
      print('Error loading todos: $e'); // Debugging log
    }
  }

  //method to add tasks
  void _addTask() async {

    try {

      if (_taskController.text.isNotEmpty) {
      final ToDo newtodo = ToDo(
        title: _taskController.text,
        time: DateTime.now(),
        isDone: false,
        date: DateTime.now(),
      );

      await toDoService.addToDo(newtodo);
      setState(() {
        allToDos.add(newtodo);
        incompletedToDos.add(newtodo);
      });
      AppHelpers.showSnackBar(context, "To Do Added successfully!!");
      Navigator.pop(context);
    }
      
    } catch (e) {
      print(e.toString());
      AppHelpers.showSnackBar(context, "Failed to added to do");
      Navigator.pop(context);
    }
    
  }

  void openMessageModel(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.aCardColor,
            title: Text(
              "Add Task",
              style: AppTextStyles.appDescription.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: TextField(
              controller: _taskController,
              style: TextStyle(
                color: AppColors.aWhiteColor,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Enter Your Task",
                hintStyle: AppTextStyles.appDescriptionSmall,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  _addTask();
                },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    AppColors.aFabColor,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                child: const Text(
                  "Add Task",
                  style: AppTextStyles.appButton,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    AppColors.aFabColor,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                child: const Text(
                  "Cancel",
                  style: AppTextStyles.appButton,
                ),
              ),
            ],
          );
        });
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
        onPressed: () {
          openMessageModel(context);
        },
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
            completeToDo: completedToDos,
          ),
          CompletedTab(
            completedToDOs: completedToDos,
            incompletedToDos: incompletedToDos,
          )
        ],
      ),
    );
  }
}

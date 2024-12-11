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
    final bool isnewUser = await toDoService.isNewUser();
    if (isnewUser) {
      _loadToDos();
    }
  }

  Future<void> _loadToDos() async {
    final List<ToDo> _loadedToDOs = toDoService.loadTodos() as List<ToDo>;
    setState(() {
      allToDos = _loadedToDOs;
      incompletedToDos = allToDos.where((todo) => !todo.isDone).toList();
      completedToDos = allToDos.where((todo) => !todo.isDone).toList();
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

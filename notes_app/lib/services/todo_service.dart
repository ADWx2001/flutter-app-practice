import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';
import 'package:notes_app/models/todo_model.dart';

class TodoService {
  //all todos
  List<ToDo> todos = [
    ToDo(
      title: "Read a Book",
      date: DateTime.now(),
      time: DateTime.now(),
      isDone: true,
    ),
    ToDo(
      title: "Go for a Walk",
      date: DateTime.now(),
      time: DateTime.now(),
      isDone: false,
    ),
    ToDo(
      title: "Complete Assignment",
      date: DateTime.now(),
      time: DateTime.now(), 
      isDone: false,
    ),
  ];

  //create the database reference for todos
  final _myBox = Hive.box("todos");

  //check weather the user is new user
  Future<bool> isNewUser() async {
    return _myBox.isEmpty;
  }

  // Method to create the initial todos if the box is empty
  Future<void> createInitialTodos() async {
    if (_myBox.isEmpty) {
      await _myBox.put("todos", todos);
    }
  }

  // Method to load the todos
  Future <List<ToDo>> loadTodos() async {
    final dynamic todos = await _myBox.get("todos");
    if (todos != null && todos is List<dynamic>) {
      return todos.cast<ToDo>().toList();
    }
    return [];
  }

  //mark todo as done
  Future<void> markAsDone(ToDo todo) async{
    try {
      final dynamic allToDos = await _myBox.get("todos");
      final int index = allToDos.indexWhere((element)=> element.id == todo.id);
      allToDos[index] = todo;

      await _myBox.put("todos", todo);
    } catch (e) {
      print(e.toString());
    }
  }

   //mark todo as undone
  Future<void> markAsunDone(ToDo todo) async{
    try {
      final dynamic allToDos = await _myBox.get("todos");
      final int index = allToDos.indexWhere((element)=> element.id == todo.id);
      allToDos[index] = todo;

      await _myBox.put("todos", todo);
    } catch (e) {
      print(e.toString());
    }
  }

  //add todo
  Future<void> addToDo(ToDo todo) async{
    try {
      final dynamic allToDos = await _myBox.get("todos");
      allToDos.add(todo);

      await _myBox.put("todos", allToDos);
    } catch (e) {
      print(e.toString());
    }
  }

  //methos to delete todo
  Future <void> deleteToDo(ToDo todo) async{
    try {
      final dynamic allToDos = await _myBox.get("todos");
      //final int index = allToDos.indexWhere((element)=> element.id == todo.id);
      allToDos.remove(todo);

      await _myBox.add(allToDos);

    } catch (e) {
      print(e.toString());
    }
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/pages/create_new_note.dart';
import 'package:notes_app/pages/edit_note.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:notes_app/pages/notes_by_category.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:notes_app/pages/todo_page.dart';

class AppRouter{

  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true, //check if there any error occured in route or any router data can be see here
    initialLocation: "/",
    routes: [
      //home page
      GoRoute(
        name: "home",
        path: '/',
        builder: (context, state) {
          return HomePage();
        },
      ),

      //go to notes page
      GoRoute(
        name: "notes",
        path: '/notes',
        builder: (context, state) {
          return NotesPage();
        },
      ),

      //go to todo page
      GoRoute(
        name: "category",
        path: '/category',
        builder: (context, state) {
          final String category = state.extra as String;
          return NotesByCategory(category: category);
        },
      ),

      //go to category page by name
      GoRoute(
        name: "todo",
        path: '/todos',
        builder: (context, state) {
          return TodoPage();
        },
      ),

      //create new note
      GoRoute(
        name: "create_new_note",
        path: '/create-note',
        builder: (context, state) {
          final bool isNewNote = state.extra as bool;
          return CreateNewNote(isNewCategory: isNewNote,);
        },
      ),

      //edit note
      GoRoute(
        name: "edit_note",
        path: '/edit-note',
        builder: (context, state) {
          final Note note = state.extra as Note;
          return EditNote(note: note,);
        } 
        // // },
        // builder: (context, state){
        //   return EditNote();
        // }
      ),

    ],
  );
}
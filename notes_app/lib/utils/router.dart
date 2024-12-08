import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/pages/home_page.dart';
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
        name: "todo",
        path: '/todos',
        builder: (context, state) {
          return TodoPage();
        },
      ),


    ],
  );
}
import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/router.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () { 
            AppRouter.router.push("/");
           },
          icon: const Icon(Icons.arrow_back), 
          color: AppColors.aWhiteColor, 
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.add,
          color: AppColors.aWhiteColor,
          size: 30,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Notes")
          ],
        ),
      ),
    );
  }
}

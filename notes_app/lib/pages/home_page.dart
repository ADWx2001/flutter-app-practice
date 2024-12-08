import 'package:flutter/material.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/notes_todo.dart';
import 'package:notes_app/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: AppTextStyles.appTitle,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          
          children: [
            ProgressCard(completedTasks: 5, totalTasks: 6),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NotesTodo(title: 'To Do', description: "2", iconName: Icons.bookmark_add,),
                NotesTodo(title: 'To Do', description: "2", iconName: Icons.calendar_month_sharp,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
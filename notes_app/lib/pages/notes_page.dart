import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/note_servies.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/router.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  final NoteServies noteService = NoteServies();
  List<Note> allNotes = [];
  Map<String, List<Note>> notesByCategory = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfUserIsNew;
  }

  void _checkIfUserIsNew() async{
    final bool isNewUser = await noteService.isFirstTime();

    if(isNewUser){
      await noteService.createInitialNotes();
    }

    //load notes
    _loadNotes();
    
  }

  //load the notes
  Future<void> _loadNotes() async {
    final List<Note> loadedNotes = await noteService.loadNotes();
    final Map<String, List<Note>> noteswithCategory = 
      noteService.getNotesByCategoryMap(loadedNotes);
    setState(() {
      allNotes = loadedNotes;
      notesByCategory = noteswithCategory; 
    });
  }

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

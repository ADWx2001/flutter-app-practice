import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/note_servies.dart';

class NotesByCategory extends StatefulWidget {
  final String category;

  const NotesByCategory({
    super.key, 
    required this.category
  });

  @override
  State<NotesByCategory> createState() => _NotesByCategoryState();
}

class _NotesByCategoryState extends State<NotesByCategory> {
  final NoteServies noteservice = NoteServies();
  List<Note> noteListByCategory = [];

  @override
  void initState() {
    super.initState();
    _loadNotesByCategoryName();
  }

  //load all notes by category
  Future <void> _loadNotesByCategoryName() async{
    noteListByCategory = await noteservice.getNoteByCategoryName(widget.category);
    setState(() {
      print(noteListByCategory.length);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      )
    );
  }
}
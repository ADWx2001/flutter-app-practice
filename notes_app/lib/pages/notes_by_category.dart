import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/note_servies.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';

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
        //remove the back button
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AppRouter.router.push(
              "/notes",
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.aDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.category,
                style: AppTextStyles.appTitle,
              ),
              const SizedBox(
                height: 30,
              ),
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: AppConstants.aDefaultPadding,
              //     mainAxisSpacing: AppConstants.aDefaultPadding,
              //     childAspectRatio: 7 / 11,
              //   ),
              //   itemCount: noteList.length,
              //   itemBuilder: (context, index) {
              //     return NoteCategoryCard(
              //       noteTitle: noteList[index].title,
              //       noteContent: noteList[index].content,
              //       removeNote: () async {
              //         await _removeNote(noteList[index].id);
              //         setState(() {
              //           noteList.removeAt(index);
              //         });
              //       },
              //       editNote: () async {
              //         _editNote(noteList[index]);
              //       },
              //       viewSingleNote: () {
              //         AppRouter.router.push(
              //           "/single-note",
              //           extra: noteList[index],
              //         );
              //       },
              //     );
              //   },
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
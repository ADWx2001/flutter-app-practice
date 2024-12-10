import 'package:flutter/material.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/note_servies.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/note_category_card.dart';

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

  //remove note
  Future<void> _removeNote(String id) async {
    try {
      await noteservice.deleteNote(id);
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        AppHelpers.showSnackBar(context, "Note deleted successfully");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      AppHelpers.showSnackBar(context, "Failed to delete note");
    }
  }

  //edit note
  void _editNote(Note note) {
    //navigate to the edit note page
    AppRouter.router.push('/edit-note', extra: note);
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
              GridView.builder(
                
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.aDefaultPadding,
                  mainAxisSpacing: AppConstants.aDefaultPadding,
                  childAspectRatio: 7 / 11,
                ),
                itemCount: noteListByCategory.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    
                    child: NoteCategoryCard(
                      noteTitle: noteListByCategory[index].title,
                      noteContent: noteListByCategory[index].content,
                      removeNote: () async {
                        await _removeNote(noteListByCategory[index].id);
                        setState(() {
                          noteListByCategory.removeAt(index);
                        });
                      },
                      editNote: () async {
                        _editNote(noteListByCategory[index]);
                      },
                      viewSingleNote: () {
                        AppRouter.router.push(
                          "/single-note",
                          extra: noteListByCategory[index],
                        );
                      },
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
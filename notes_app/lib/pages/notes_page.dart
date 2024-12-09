import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/note_servies.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/text_styles.dart';
import 'package:notes_app/widgets/notes_card.dart';

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
    super.initState();
    _checkIfUserIsNew(); // Add parentheses to ensure this method is invoked
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AppRouter.router.go(
              "/",
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            side: BorderSide(
              color: AppColors.aWhiteColor,
              width: 2,
            )),
        backgroundColor: AppColors.aFabColor,
        child: Icon(
          Icons.add,
          color: AppColors.aWhiteColor,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppConstants.aDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notes',
              style: AppTextStyles.appTitle,
            ),
            const SizedBox(height: 30),
            allNotes.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                      child: Text(
                        "No notes available , click on the + button to add a new note",
                        style: TextStyle(
                          color: AppColors.aWhiteColor.withOpacity(0.7),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )

                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppConstants.aDefaultPadding,
                      mainAxisSpacing: AppConstants.aDefaultPadding,
                      childAspectRatio: 6 / 4,
                    ),
                    itemCount: notesByCategory.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //go to notes by category
                          AppRouter.router.push(
                            "/category",
                            extra: notesByCategory.keys.elementAt(index),
                          );
                        },
                        child: NotesCard(
                          noteCategory: notesByCategory.keys.elementAt(index),
                          noOfNotes:
                              notesByCategory.values.elementAt(index).length,
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

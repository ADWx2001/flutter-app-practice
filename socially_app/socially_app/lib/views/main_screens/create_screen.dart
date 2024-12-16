import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socially_app/models/user_model.dart';
import 'package:socially_app/services/feed/feed_service.dart';
import 'package:socially_app/services/users/user_sevices.dart';
import 'package:socially_app/utils/functions/functions.dart';
import 'package:socially_app/widgets/reusable/custom_button.dart';
import 'package:socially_app/widgets/reusable/custom_input.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _captionController = TextEditingController();
  File? _imageFile;
  Mood _selectedMood = Mood.happy;
  bool _isUploading = false;

  //pick an image
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  //Submit form
  void _submitPost() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        setState(() {
          _isUploading = true;
        });

        //if the platform is web
        if (kIsWeb) {
          return;
        }

        final String postCaption = _captionController.text;
        //get current user
        final User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          //fetch user details from fire store
          final UserModel? userData = await UserService().getUserById(user.uid);

          if (userData != null) {
            final postDetails = {
              "postCaption":postCaption,
              "mood":_selectedMood.name,
              "userId": userData.userId,
              "userName": userData.name,
              "profImage": userData.imageUrl,
              "postImage":_imageFile
            };

            // save post
            await FeedService().savePost(postDetails);

            UtilFunction().showSnackBar(context, "Post created sucessfully");
          }
        }
      } catch (e) {
        print(e.toString());
         UtilFunction().showSnackBar(context, "Error occured creating post");
      }finally{
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableInput(
                  controller: _captionController,
                  labelText: "Caption",
                  icon: Icons.text_fields,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a caption";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownButton<Mood>(
                  value: _selectedMood, //default value
                  items: Mood.values.map((Mood mood) {
                    return DropdownMenuItem(
                      value: mood,
                      child: Text("${mood.name} ${mood.emoji}"),
                    );
                  }).toList(),
                  onChanged: (Mood? newMood) {
                    setState(() {
                      _selectedMood = newMood ?? _selectedMood;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                _imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: kIsWeb
                            ? Image.network(_imageFile!.path)
                            : Image.file(_imageFile!),
                      )
                    : const Text("No image selected"),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableButton(
                      text: "Use Camera",
                      onPressed: () => _pickImage(ImageSource.camera),
                      width: MediaQuery.of(context).size.width * 0.43,
                    ),
                    ReusableButton(
                      text: "Use Galley",
                      onPressed: () => _pickImage(ImageSource.gallery),
                      width: MediaQuery.of(context).size.width * 0.43,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ReusableButton(
                  text: kIsWeb ? "Not Supported": _isUploading ? "Uploading..." : "Upload",
                  //TODO: write submit function
                  onPressed: _submitPost,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

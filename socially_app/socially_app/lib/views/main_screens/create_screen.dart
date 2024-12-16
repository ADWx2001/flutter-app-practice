import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
                  text: "Submit",
                  //TODO: write submit function
                  onPressed: (){},
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

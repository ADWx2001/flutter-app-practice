import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/models/user_model.dart';
import 'package:socially_app/services/users/user_sevices.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<UserModel> _users = [];
  List<User> filteredUsers = [];

  Future<void> _fetchAllUsers() async {
    try {
      final List<UserModel> users = await UserService().getAllUsers();
      setState(() {
        _users = users;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {

    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(8),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: inputBorder,
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

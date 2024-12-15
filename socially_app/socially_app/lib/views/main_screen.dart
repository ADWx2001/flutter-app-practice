import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/views/main_screens/create_screen.dart';
import 'package:socially_app/views/main_screens/feed_screen.dart';
import 'package:socially_app/views/main_screens/profile_screen.dart';
import 'package:socially_app/views/main_screens/reels_screen.dart';
import 'package:socially_app/views/main_screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FeedScreen(),
    SearchScreen(),
    CreateScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: "Create"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Feed"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Home"
          ),

        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_currentIndex],
    );
  }
}

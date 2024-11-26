import 'package:flutter/material.dart';
import 'package:shopping_app_ui/widgets/app_bar/app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarLeading,
        title: appBarTitle,
        actions: appBaractions,
      ),
    );
  }
}
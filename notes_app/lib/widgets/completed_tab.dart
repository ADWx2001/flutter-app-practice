import 'package:flutter/material.dart';
import 'package:notes_app/utils/text_styles.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({super.key});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Completed tab", style: AppTextStyles.appBody,),
    );
  }
}
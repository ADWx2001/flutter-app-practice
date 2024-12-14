import 'package:flutter/material.dart';
import 'package:socially_app/utils/constants/app_constants.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget MobileScreenLayout;
  final Widget WebScreenLayout;

  const ResponsiveLayout({
    super.key,
    required this.MobileScreenLayout,
    required this.WebScreenLayout,
  });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth > webScreenWidth){
          return widget.WebScreenLayout;
        }else{
          return widget.MobileScreenLayout;
        }
      },
    );
  }
}

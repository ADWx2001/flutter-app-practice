import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/utils/router.dart';
import 'package:notes_app/utils/theme_data.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme.copyWith(
        textTheme:  GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      routerConfig: AppRouter.router,
    );
  }
}
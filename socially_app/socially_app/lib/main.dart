import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socially_app/firebase_options.dart';
import 'package:socially_app/router/router.dart';
import 'package:socially_app/utils/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          selectedItemColor: mainOrangeColor,
          unselectedItemColor: mainWhiteColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: mainOrangeColor,
          contentTextStyle: TextStyle(
            color: mainWhiteColor,
            fontSize: 16
          ),
        ),
      ),
      routerConfig: RouterClass().router,
      debugShowCheckedModeBanner: false,
      
    );
  }
}

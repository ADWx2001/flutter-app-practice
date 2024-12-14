import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/firebase_options.dart';
import 'package:socially_app/views/res/mobile_layout.dart';
import 'package:socially_app/views/res/responsive_layout.dart';
import 'package:socially_app/views/res/web_layout.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        MobileScreenLayout: MobileScreenLayout(),
        WebScreenLayout: WebScreenLayout(),
      ),
    );
  }
}

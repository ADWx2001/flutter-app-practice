import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlrZqTCInyg6RfYC7Ape20o-EWP1EN_A8fOA&s'),
              ),
              Text(
                'Asanka Wickramasurendra',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceCodePro',
                  letterSpacing: 2.5, 
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '070 119 4600',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ), 
                ),
              ),
              
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.teal.shade900,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'asankadilshanme@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ), 
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            title: const Text(
              'Flutter Demo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions:const <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              )
            ],
            backgroundColor: Colors.purple,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            color: Colors.purple,
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            color: Colors.purple,
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), 
        ),
      ),
    );
  }
}
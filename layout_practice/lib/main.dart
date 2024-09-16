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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 175,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 175,
                            width: 175,
                            color: Colors.green,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            width: 175,
                            color: Colors.yellow,
                          ),
                          Container(
                            height: 80,
                            width: 175,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.purple,
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.red,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          color: Colors.green,
                        ),
                        Container(
                          height: 100,
                          width: 150,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 150,
                            color: Colors.purple,
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            color: Colors.purple[800],
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(100),
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(100),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(100),
                        color: Colors.yellow,
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(100),
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ) 
        ),
      ),
    );
  }
}
import 'dart:ffi';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  final TextEditingController _nummber1 = TextEditingController();
  final TextEditingController _nummber2 = TextEditingController();

  int _result = 0;

  void add(){
    setState(() {
      int num1 = int.parse(_nummber1.text);
      int num2 = int.parse(_nummber2.text);

      _result = num1 + num2;

    });
  }

  void substract(){
    setState(() {
      int num1 = int.parse(_nummber1.text);
      int num2 = int.parse(_nummber2.text);

      _result = num1 - num2;
      
    });
  }

  void multiply(){
    setState(() {
      int num1 = int.parse(_nummber1.text);
      int num2 = int.parse(_nummber2.text);

      _result = num1 * num2;
      
    });
  }

  void divition(){
    setState(() {
      int num1 = int.parse(_nummber1.text);
      int num2 = int.parse(_nummber2.text);

      _result = (num1/num2) as int;
      
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nummber1.dispose();
    _nummber2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.green[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _nummber1,
              decoration: InputDecoration(
                hintText: "Enter First Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.all(20)
              ),
              // onChanged: setState(() {
              //   firstNumber;
              // }),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _nummber2,
              decoration: InputDecoration(
                hintText: "Enter Second Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.all(20)
              ),
              // onChanged: setState(() {
              //   secondNumber;
              // }),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("answer is:"),            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: add,
                  tooltip: "title",
                  child: const Icon(Icons.add),
                ),

                FloatingActionButton(
                  onPressed: substract,
                  tooltip: "title",
                  child: const Icon(Icons.remove),
                ),

                FloatingActionButton(
                  onPressed: multiply,
                  tooltip: "title",
                  child: const Icon(Icons.create),
                ),

                FloatingActionButton(
                  onPressed: divition,
                  tooltip: "title",
                  child: const Icon(Icons.safety_divider),
                ),

              ],
            ),



          ],
        ),
      ),
    );
  }
}
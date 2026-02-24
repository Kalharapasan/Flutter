import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  String result = "0";

  void add() {
    double n1 = double.parse(num1.text);
    double n2 = double.parse(num2.text);
    setState(() {
      result = (n1 + n2).toString();
    });
  }

  void subtract() {
    double n1 = double.parse(num1.text);
    double n2 = double.parse(num2.text);
    setState(() {
      result = (n1 - n2).toString();
    });
  }

  void multiply() {
    double n1 = double.parse(num1.text);
    double n2 = double.parse(num2.text);
    setState(() {
      result = (n1 * n2).toString();
    });
  }

  void divide() {
    double n1 = double.parse(num1.text);
    double n2 = double.parse(num2.text);

    if (n2 == 0) {
      setState(() {
        result = "Cannot divide by 0";
      });
    } else {
      setState(() {
        result = (n1 / n2).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "First Number",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Second Number",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: add, child: Icon(Icons.add)),
                ElevatedButton(onPressed: subtract, child: Icon(Icons.remove)),
                ElevatedButton(onPressed: multiply, child: Icon(Icons.close)),
                ElevatedButton(onPressed: divide, child: Icon(Icons.percent)),
              ],
            ),

            SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.purple.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                result,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
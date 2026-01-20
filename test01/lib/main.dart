import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final TextEditingController _controller = TextEditingController();

  String displayText = "";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  final List<String> buttons = [
    "%", "CE", "C", "/",
    "7", "8", "9", "*",
    "4", "5", "6", "-",
    "1", "2", "3", "+",
    ".", "0", "=",
  ];

  void onButtonPressed(String value) {
    setState(() {
      // Clear all
      if (value == "C") {
        displayText = "";
        num1 = 0;
        num2 = 0;
        operator = "";
      }

      // Backspace
      else if (value == "CE") {
        if (displayText.isNotEmpty) {
          displayText =
              displayText.substring(0, displayText.length - 1);
        }
      }

      // Operator pressed
      else if (_isOperator(value) && value != "=") {
        if (displayText.isNotEmpty) {
          num1 = double.parse(displayText);
          operator = value;
          displayText = "";
        }
      }

      // Equal pressed
      else if (value == "=") {
        if (displayText.isNotEmpty && operator.isNotEmpty) {
          num2 = double.parse(displayText);
          double result = _calculate(num1, num2, operator);
          displayText = result.toString();
          operator = "";
        }
      }

      // Numbers & dot
      else {
        displayText += value;
      }

      _controller.text = displayText;
    });
  }

  double _calculate(double n1, double n2, String op) {
    switch (op) {
      case "+":
        return n1 + n2;
      case "-":
        return n1 - n2;
      case "*":
        return n1 * n2;
      case "/":
        if (n2 == 0) return 0;
        return n1 / n2;
      case "%":
        return n1 % n2;
      default:
        return 0;
    }
  }

  bool _isOperator(String text) {
    return ["+", "-", "*", "/", "=", "%"].contains(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Calculator",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 32),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "0",
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () =>
                        onButtonPressed(buttons[index]),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isOperator(buttons[index])
                          ? Colors.orange
                          : Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      buttons[index],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

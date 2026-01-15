import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home:Home()
    )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo App"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: const Center(
          child: Text(
            "My Name is Kalhara",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey,
              fontFamily: "Schyler"
              ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Button Clicked");
          },
          child: const Text("Click Me"),
          backgroundColor: Colors.red,
        ),
      );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Demo App"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "My Name is Kalhara",
            style: TextStyle(fontSize: 20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Button Clicked");
          },
          child: const Text("Click Me"),
        ),
      ),
    ),
  );
}

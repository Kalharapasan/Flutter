import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Screen")),
      body: const Center(
        child: Text(
          "You opened this screen by tapping a card!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

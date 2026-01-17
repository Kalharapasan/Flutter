import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String name;

  const SecondScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Received Name:",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              name.isEmpty ? "No Name Entered" : name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              child: const Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
s
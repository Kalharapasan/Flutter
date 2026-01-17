import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String name = args?['name'] ?? "No Name";
    final String payment = args?['payment'] ?? "None";
    final bool agree = args?['agree'] ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: $name", style: const TextStyle(fontSize: 18)),
            Text("Payment: $payment", style: const TextStyle(fontSize: 18)),
            Text("Agreed: $agree", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text("Send Back & Go Back"),
              onPressed: () {
                Navigator.pop(context, "Data received successfully!");
              },
            ),
          ],
        ),
      ),
    );
  }
}

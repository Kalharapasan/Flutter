import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String name = args['name'];
    final String payment = args['payment'];
    final bool agree = args['agree'];

    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Name: $name", style: const TextStyle(fontSize: 18)),
            Text("Payment: $payment", style: const TextStyle(fontSize: 18)),
            Text("Agreed: $agree", style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 30),

            /// SEND DATA BACK
            ElevatedButton(
              child: const Text("Send Back & Go Back"),
              onPressed: () {
                Navigator.pop(context, "Data received successfully");
              },
            ),
          ],
        ),
      ),
    );
  }
}

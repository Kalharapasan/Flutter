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
      home: RadioExample(),
    );
  }
}

enum PaymentMethod { cash, card, online }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});
  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  PaymentMethod _method = PaymentMethod.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<PaymentMethod>(
              title: const Text("Cash"),
              value: PaymentMethod.cash,
              groupValue: _method,
              onChanged: (value) {
                setState(() {
                  _method = value!;
                });
              },
            ),

            RadioListTile<PaymentMethod>(
              title: const Text("Card"),
              value: PaymentMethod.card,
              groupValue: _method,
              onChanged: (value) {
                setState(() {
                  _method = value!;
                });
              },
            ),

            RadioListTile<PaymentMethod>(
              title: const Text("Online"),
              value: PaymentMethod.online,
              groupValue: _method,
              onChanged: (value) {
                setState(() {
                  _method = value!;
                });
              },
            ),

            const SizedBox(height: 20),
            Text(
              "Selected Method: ${_method.name.toUpperCase()}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

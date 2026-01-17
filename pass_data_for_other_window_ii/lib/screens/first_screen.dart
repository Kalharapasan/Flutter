import 'package:flutter/material.dart';

enum PaymentMethod { cash, card, online }

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  PaymentMethod _payment = PaymentMethod.cash;
  bool agree = false;
  String returnedData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            /// TEXTFIELD
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            /// RADIO GROUP
            const Text("Payment Method", style: TextStyle(fontSize: 16)),
            RadioListTile(
              title: const Text("Cash"),
              value: PaymentMethod.cash,
              groupValue: _payment,
              onChanged: (value) {
                setState(() {
                  _payment = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text("Card"),
              value: PaymentMethod.card,
              groupValue: _payment,
              onChanged: (value) {
                setState(() {
                  _payment = value!;
                });
              },
            ),

            const SizedBox(height: 10),

            /// CHECKBOX
            CheckboxListTile(
              title: const Text("Agree to Terms"),
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            /// OPEN SECOND SCREEN
            ElevatedButton(
              child: const Text("Open Second Screen"),
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: {
                    'name': nameController.text,
                    'payment': _payment.name,
                    'agree': agree,
                  },
                );

                setState(() {
                  returnedData = result ?? "";
                });
              },
            ),

            const SizedBox(height: 20),

            /// DATA RETURNED
            Text(
              "Returned Data: $returnedData",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

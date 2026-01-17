import 'package:flutter/material.dart';

enum PaymentMethod { cash, card, online }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextField controller
  final TextEditingController nameController = TextEditingController();

  // Radio
  PaymentMethod _payment = PaymentMethod.cash;

  // Checkbox
  bool agree = false;

  // Data returned from next screen
  String returnedData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Flutter UI Example"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// TextField
          const Text("Enter Name:", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Type your name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),

          const SizedBox(height: 20),

          /// Radio Group
          const Text("Select Payment Method:", style: TextStyle(fontSize: 16)),
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
          RadioListTile(
            title: const Text("Online"),
            value: PaymentMethod.online,
            groupValue: _payment,
            onChanged: (value) {
              setState(() {
                _payment = value!;
              });
            },
          ),

          /// Checkbox
          CheckboxListTile(
            title: const Text("Agree to Terms & Conditions"),
            value: agree,
            onChanged: (value) {
              setState(() {
                agree = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          /// Horizontal Cards
          const Text("Horizontal Cards", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _horizontalCard(Icons.home, "Home"),
                _horizontalCard(Icons.settings, "Settings"),
                _horizontalCard(Icons.person, "Profile"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Image Card
          const Text("Image Card", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          _imageCard(context),

          const SizedBox(height: 20),

          /// Grid Cards
          const Text("Grid Cards", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _gridCard(context, Icons.phone, "Phone"),
              _gridCard(context, Icons.camera, "Camera"),
              _gridCard(context, Icons.map, "Map"),
              _gridCard(context, Icons.music_note, "Music"),
            ],
          ),

          const SizedBox(height: 20),

          /// Button to go to Detail Screen
          ElevatedButton(
            child: const Text("Go to Detail Screen"),
            onPressed: () async {
              final result = await Navigator.pushNamed(
                context,
                '/detail',
                arguments: {
                  'name': nameController.text,
                  'payment': _payment.name,
                  'agree': agree,
                },
              );

              setState(() {
                returnedData = (result as String?) ?? "";
              });
            },
          ),

          const SizedBox(height: 10),

          /// Display returned data
          Text("Returned Data: $returnedData", style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  // Horizontal card widget
  Widget _horizontalCard(IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.only(right: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.deepPurple),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  // Image card with navigation
  Widget _imageCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Column(
          children: [
            Image.network(
              "https://picsum.photos/400/200",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text("Tap to open detail screen"),
            ),
          ],
        ),
      ),
    );
  }

  // Grid card with navigation
  Widget _gridCard(BuildContext context, IconData icon, String title) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.deepPurple),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}

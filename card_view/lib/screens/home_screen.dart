import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card Examples")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// HORIZONTAL CARDS
          const Text("Horizontal Cards", style: TextStyle(fontSize: 18)),
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

          /// IMAGE CARD
          const Text("Image Card", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          _imageCard(context),

          const SizedBox(height: 20),

          /// GRID CARD LAYOUT
          const Text("Grid Cards", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _gridCard(context, Icons.phone, "Phone"),
              _gridCard(context, Icons.camera, "Camera"),
              _gridCard(context, Icons.map, "Map"),
              _gridCard(context, Icons.music_note, "Music"),
            ],
          ),
        ],
      ),
    );
  }

  /// HORIZONTAL CARD
  Widget _horizontalCard(IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.only(right: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  /// IMAGE CARD WITH NAVIGATION
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
              child: Text(
                "Tap to Open Detail Screen",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// GRID CARD WITH NAVIGATION
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
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}

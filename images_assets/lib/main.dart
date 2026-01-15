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
          child: Image(image: 
          //NetworkImage("https://images.pexels.com/photos/18928571/pexels-photo-18928571.jpeg"))
          AssetImage("assets/images/img.jpg")),
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
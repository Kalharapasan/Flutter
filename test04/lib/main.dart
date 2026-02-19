import 'package:flutter/material.dart';
import 'package:test04/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FristScreen(),
    );
  }
}

class FristScreen extends StatelessWidget {
  const FristScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "First Screen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,           
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute
              (
                builder:(context) => const SecondScreen()
              )
            );
          }, 
          child: Text("Open",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),)
          ),
      ),
    );
  }
}

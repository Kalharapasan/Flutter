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
        // body:Container(
        //   padding: EdgeInsets.all(22.0),
        //   color: Colors.amber,
        //   child: Text("Hello"),
        // )
         body:Padding(
          padding: EdgeInsets.all(22.0),
          child: Text("Hello"),
        )
      );
  }
}
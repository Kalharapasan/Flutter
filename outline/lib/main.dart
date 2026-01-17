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
         body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.black,
              child:Text("one") ,
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber,
              child:Text("Tow") 
            ),
            Container(
              padding: EdgeInsets.all(40.0),
              color: Colors.red,
              child:Text("Three") 
            )
          ],

         )
      );
  }
}
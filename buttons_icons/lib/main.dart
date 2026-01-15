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
        body:Center(
          // child: Icon(
          //   Icons.access_alarms,
          //   color: Colors.amber,
          //   size: 50,
          // ),

          child:ElevatedButton(onPressed: (){}, 
          child:Text("Cilkme",
          style: TextStyle(
            color: Colors.blueGrey
          ),))

        )
      );
  }
}
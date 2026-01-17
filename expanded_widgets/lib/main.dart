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
         body:Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.black,
                child:Text("1") ,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.amber,
                child:Text("3") 
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.red,
                child:Text("2") 
              ),
            )
          ],

         )
      );
  }
}

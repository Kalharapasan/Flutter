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
          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children :[
            ElevatedButton(onPressed: 
            (){}, child: Text("Button")),
            Text("Hello",style: TextStyle(
              fontSize: 20,
            ),),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(30.0),
              child:Text("Inside Container")
            )
          ]
         )
      );
  }
}
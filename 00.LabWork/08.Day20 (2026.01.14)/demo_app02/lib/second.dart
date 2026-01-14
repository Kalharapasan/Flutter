import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Second extends StatelessWidget {
  final String n1;
  const Second({super.key,re, required this.n1});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Second Page" ,style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.amber,
      ),
      body: Center(
          // child: ElevatedButton(onPressed: (){
          //   Navigator.pop(context);
          // }, child: Text("Back to Page",style: 
          // TextStyle(
          //   fontSize: 15,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.amber
          // ),)),

          child: Text("Number 01: $n1",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),),
      ),
    );
  }
}


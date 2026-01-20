import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final TextEditingController billController = TextEditingController();
  
  double tipPercentage = 0;
  double tipAmount =0;
  double billAmount =0;

  void claTip(){
    double bill =double.tryParse(billController.text) ?? 0; 
    setState(() {
      tipAmount = bill*(tipPercentage/100);
      billAmount = bill+tipAmount;

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: const Text("Tip Calculator"),
          backgroundColor: Colors.cyanAccent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(
                color: Colors.amber,
                shadowColor: Colors.amber,
                elevation: 4,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) ,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Bill Amount: ",style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),),
                      SizedBox(height: 26,),
                      TextField(
                        controller: billController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Bill Amount",
                          border: OutlineInputBorder(),    
                          prefixIcon: Icon(Icons.attach_money),
                          fillColor: Colors.red,
                          filled: true,
                          
                        ),
                      ),
                      SizedBox(height: 26.0,)
                    ],
                  ),
                ),
               ),
             )
             ,
          
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(
                color: Colors.amber,
                shadowColor: Colors.amber,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Text("Precentage: ${tipPercentage.toInt()}%",style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),),
                    SizedBox(height: 26.0,),
                    Slider(
                      value: tipPercentage,
                      onChanged: (value){
                        setState(() {
                          tipPercentage= value;
                        });
                      },
                      min:0,
                      max:100,
                      divisions: 100,
                      
                      label: "${tipPercentage.toInt()}",
                      ),
                  ],
                ), 
               ),
             ),
             
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 60.0,
                child: ElevatedButton(onPressed: claTip, 
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  backgroundColor: Colors.red
                ),
                child:Text("Calculate",
                  style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,     
                    ),
                  ) 
                ),
              ),
            ),

            SizedBox(height: 26.0,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.red,
                shadowColor: Colors.amber,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Bill Amount: ${billAmount.toInt()}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:Colors.black
                      ),),    
                      Text("Tip Ammount: ${tipAmount.toInt()}",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),)
                    ],
                  ),
                ),
              ),
            )

             
      
            ],
          ),
        ),
      ),
    );
  }
}
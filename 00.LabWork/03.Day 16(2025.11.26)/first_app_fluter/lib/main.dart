import 'package:flutter/material.dart';

void main() {
  // runApp(MaterialApp(
  //   home: Text("My first App"),
  // ));

  runApp(MaterialApp(

    home: Scaffold(
      appBar: AppBar(
          title: Text("SEU/IS/20/ICT/084"),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
      ),

      body: Center(
        child: Text("Hello body of the app"
        ,style: TextStyle(
          fontSize: 50,
          fontFamily: "Time New Roman",
          color: const Color.fromARGB(255, 0, 0, 0),
        ),),
        
        
      ),
      backgroundColor:const Color.fromARGB(255, 5, 192, 243),


      floatingActionButton: FloatingActionButton(onPressed: (){} ,
        child: Text("+"),
        backgroundColor:const Color.fromARGB(255, 243, 228, 245)
      ),

      bottomNavigationBar: BottomNavigationBar(
        items:[

          BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.access_time_rounded),label: "Menu"),
          BottomNavigationBarItem(icon:Icon(Icons.access_alarm),label: "Stop")

        ]
                
      ),


      ),

    ),

  );

}


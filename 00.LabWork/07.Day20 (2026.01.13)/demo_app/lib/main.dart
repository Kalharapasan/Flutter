import 'package:flutter/material.dart';

void main() {
  runApp(const AppHome());
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: countApp(),
    );
  }
}


class countApp extends StatefulWidget {
  const countApp({super.key});

  @override
  State<countApp> createState() => _countAppState();
}

class _countAppState extends State<countApp> {
  
  int count =0;

  void countUp(){
    setState(() {
      count++;
    });
  }
  void countDown(){
    setState(() {
      count--;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: Text("Count App",style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          backgroundColor: const Color.fromARGB(196, 16, 15, 15),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[ 
              ElevatedButton(onPressed: countUp, child: Text(
                "+",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black
                ),
              )),
              SizedBox(height: 25.0,),

                Text("Count : $count" , style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 18, 59, 206)
                )
              ),
              SizedBox(height: 25.0,),
              ElevatedButton(onPressed: countDown, child: Text("-",
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.black
              ),))
          ]),
        ),

        floatingActionButton: FloatingActionButton(onPressed: countUp,
        child: Icon(Icons.add),),
      

    );
  } 
}
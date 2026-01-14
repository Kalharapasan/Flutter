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

  String name="";

  final TextEditingController nameController = TextEditingController();
  void printName(){
    setState(() {
      name = nameController.text;//user Input
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Demo App 02",style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          backgroundColor: const Color.fromARGB(196, 16, 15, 15),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter You Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: printName, child: 
            Text("Cike Me !",style: TextStyle(
              fontSize: 12.0,color: Colors.black,
              fontWeight: FontWeight.bold
            ),)),
            SizedBox(height:16 ,),
            Text(
              "Name : $name",style: TextStyle(
                fontSize: 30.0,
                color: const Color.fromARGB(255, 39, 2, 204),
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
    ));
  } 
}
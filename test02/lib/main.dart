import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  double valuex =0;
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("My App Bar",style: TextStyle(
          color: Colors.deepOrangeAccent,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
              child: Text("1 st Container",
              textAlign: TextAlign.center,
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ) ,),
              
            ),
             Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: ElevatedButton(onPressed: (){}, child: Text("data")),
              
            ),
             Container(
              width: 200,
              height: 200,
              color: Colors.lightBlue,
              child:Slider(value:valuex, 
              onChanged:(double x) {
                setState(() {
                  valuex = x;
                });
              },
              min: 0,
              max: 100,
              divisions: 100,
              label: "${valuex.toInt().toString()}",
              ) ,
            )
          ],
        ),
      ),
    );
  }
}
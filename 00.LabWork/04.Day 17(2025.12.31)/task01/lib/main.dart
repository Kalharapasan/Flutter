import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  const MyHome ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App Bar"),
        backgroundColor: const Color.fromARGB(255, 57, 185, 25),
      ),
      body:MyAppBody() ,
    );
  }
}

class MyAppBody extends StatelessWidget {
  const MyAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    // return Container(
    //   color: Colors.amber,
    //   width: 100,
    //   height: 100,
    //   padding: EdgeInsets.fromLTRB(10, 30, 2, 0),
    //   //padding: EdgeInsets.all(8),
      
    //   child: Text("My Cantainer"
    //   ,style: TextStyle(
    //     fontSize: 20
    //   ),),
      
    // );

    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container(
        //   color: Colors.blue,
        //   width: 50,
        //   height: 100,
          
        // ),
        
        // Container(
        //   color: Colors.amber,
        //   width: 100,
        //   height: 100,
        // ),
        
        // Container(
        //   color: Colors.green,
        //   width: 200,
        //   height: 100,
        // )

        // Container(
        //   // height: 100,
        //   // width: 200,
        //   child: Image(image: NetworkImage("https://images.pexels.com/photos/31131379/pexels-photo-31131379.jpeg")),
        // )

      Container(
          width: 500,
          height: 500,
          child: Image.asset(
            "assets/o.jpg",
            
          ),
        ),
 

      ],

    );
  }
}
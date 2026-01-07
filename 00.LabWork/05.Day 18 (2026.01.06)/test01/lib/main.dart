import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyAppHome(),
  ));
}


class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App Bar"),
        backgroundColor: Colors.amber,
      ),
      body: AppBody(),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {

    // return Column(
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 100,
    //       )
    //     ],
    // );

    // return Column(
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 100,
    //       )
    //     ],
    // );

    // return Row(
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 100,
    //       )
    //     ],
    // );


    // return Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 200,
    //       )
    //     ],
    // );

    //  return Row(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
          
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 200,
    //       )
    //     ],
    // );

    //  return Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 200,
    //       )
    //     ],
    // );


    //  return Row(
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 200,
    //       )
    //     ],
    // );


    //  return Row(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 200,
    //       )
    //     ],
    // );


    //  return Row(
    //     crossAxisAlignment: CrossAxisAlignment.end,
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 200,
    //       )
    //     ],
    // );


    //  return Row(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 200,
    //       )
    //     ],
    // );


    //  return Row(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //         color: Colors.deepPurpleAccent,
    //         width: 100,
    //         height: 50,
    //       ),
    //       Container(
    //         color: Colors.amberAccent,
    //         width: 100,
    //         height: 100,
    //       ),
    //       Container(
    //         color: Colors.red,
    //         width: 100,
    //         height: 200,
    //       )
    //     ],
    // );


    // return Column(

    //   children: [
    //     Container(
    //       child: Icon(
    //         Icons.people_alt_sharp,
    //         size: 100,
    //         color: Colors.red,
    //       ),
    //     )
    //   ],
      
    // );


    // return Column(
      
    //   children: [
    //     Container(
    //       child: FilledButton(
    //         onPressed: (){}, 
    //         child: Text("Clik me"))
    //         ,
    //     )
    //   ],

    // );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
        width: 100,
        height: 100,
        color: Colors.amber,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      )
          ],
        ),
        Text("Hello",
        style: TextStyle(
          fontSize: 20
        ),),
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Container(
        width: 100,
        height: 100,
        color: Colors.amber,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      )
          ],
        )
      
    ]
    ,);

  }
}

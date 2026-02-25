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
      home: AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(  
        crossAxisAlignment: CrossAxisAlignment.center,   
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/img/img1.png", width: 100, height: 100),
                    SizedBox(height: 5),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border, size: 20))
                  ],
                ),
                width: 300,
                height: 300,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                padding: EdgeInsets.all(22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/img/img2.png", width: 100, height: 100),
                    SizedBox(height: 5),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border, size: 20))
                  ],
                ),
                width: 300,
                height: 300,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                padding: EdgeInsets.all(22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/img/img3.png", width: 100, height: 100),
                    SizedBox(height: 5),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border, size: 20))
                  ],
                ),
                width: 300,
                height: 300,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )

                ),
                padding: EdgeInsets.all(22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/img/img4.png", width: 100, height: 100),
                    SizedBox(height: 5),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border, size: 20))
                  ],
                ),
                width: 300,
                height: 300,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                padding: EdgeInsets.all(22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/img/img5.png", width: 100, height: 100),
                    SizedBox(height: 5),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border, size: 20))
                  ],
                ),
                width: 300,
                height: 300,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                padding: EdgeInsets.all(22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/img/img6.png", width: 100, height: 100),
                    SizedBox(height: 5),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border, size: 20))
                  ],
                ),
                width: 300,
                height: 300,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                padding: EdgeInsets.all(22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/img/img7.png", width: 100, height: 100),
                    SizedBox(height: 5),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border, size: 20))
                  ],
                ),
                width: 300,
                height: 300,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                padding: EdgeInsets.all(22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/img/img8.png", width: 100, height: 100),
                    SizedBox(height: 5),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite_border, size: 20))
                  ],
                ),
                width: 300,
                height: 300,
              ),
            ],
          )
        ],
      ),
    ),
    );
  }
}
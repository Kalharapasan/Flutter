import 'package:demo_app02/second.dart';
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
  
  @override
  Widget build(BuildContext context) {
    final TextEditingController fNumController =TextEditingController();
    final TextEditingController sNumController =TextEditingController();
    int result=0 ;

    void addNumber (){
        setState(() { 
          int num1=int.tryParse(fNumController.text) ?? 0;
          int num2 =int.tryParse(sNumController.text) ?? 0;
          result = num1+num2;
        });
    }

    void subNumber(){
      setState(() {
        int num1=int.tryParse(fNumController.text) ?? 0;
        int num2 =int.tryParse(sNumController.text) ?? 0;
        result =num1-num2; 
      });
    }

    void mulNumber(){
      setState(() {
        int num1=int.tryParse(fNumController.text) ?? 0;
        int num2 =int.tryParse(sNumController.text) ?? 0;
        result =num1*num2;
      });
    }

    void devNumber(){
      setState(() {
        int num1=int.tryParse(fNumController.text) ?? 0;
        int num2 =int.tryParse(sNumController.text) ?? 0;
        //result =num1/num2 as int;
        double res= num1/num2;
        result=res.toInt();
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("My Demo App 01",style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          backgroundColor: const Color.fromARGB(196, 16, 15, 15),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: fNumController,
                decoration: InputDecoration(
                  labelText: "Enter Number  01:",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                //obscureText: true,
              ),
              SizedBox(height: 25.0,),
              TextField(
                controller: sNumController,
                decoration: InputDecoration(
                  labelText : "Enter Number 02: ",
                  border: OutlineInputBorder()
                ),
                keyboardType:TextInputType.number,
                //obscureText: true,
              ),
              SizedBox(height: 25,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(onPressed: addNumber, child:Text(
                       "Add",
                       style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold
                       ), 
                      )
                      ),
                      SizedBox(width: 25,),
                      ElevatedButton(onPressed: subNumber, child: Text("Sub",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold
                      ),)),
                      SizedBox(width: 25,),
                      ElevatedButton(onPressed: mulNumber, child: Text("Mul",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0
                      ),)),
                      SizedBox(width: 15,),
                      ElevatedButton(onPressed: devNumber, child: Text("Dev",style: TextStyle(
                        fontSize: 12.0,
                        fontWeight:FontWeight.bold
                      ),))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Text("Answer: $result",style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                wordSpacing: 5.0
              ),),
              
              SizedBox(height: 25.0,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context)=>Second(
                    n1:fNumController.text)
                )
                );
              }, child: Text("Next",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              )
              )
            ],
          ),
        ),
        
    );
  } 
}
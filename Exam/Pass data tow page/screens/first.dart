import 'package:flutter/material.dart';
import 'package:test05/screens/second.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {  
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose(){
    fnameController.dispose();
    lnameController.dispose();
    ageController.dispose();
    phoneNumberController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
            child: Text(
              "Add Data Page",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: fnameController,
                      decoration: const InputDecoration(
                        labelText: "Enter You First Name",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20,),
                    
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: lnameController,
                      decoration: const InputDecoration(
                        labelText: "Enter You Last Name",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                    
                  const SizedBox(height: 20,),
                    
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: ageController,
                      decoration: const InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                    
                  const SizedBox(height: 20,),
                    
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phoneNumberController,
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                    
                  const SizedBox(height: 20,),
                    
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent,
                        ),
                        onPressed: (){
                          Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(
                              fname: fnameController.text,
                              lname: lnameController.text,
                              age: ageController.text,
                              phoneNumber: phoneNumberController.text,
                        
                            )
                          ));
                        }, 
                        child:const Text(
                            "Show Data"
                          ),
                        ),
                    ),
                  )
                    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
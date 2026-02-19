import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String fname;
  final String lname;
  final String age;
  final String phoneNumber;

  const SecondScreen(
      {
        super.key, 
        required this.fname, 
        required this.lname, 
        required this.age, 
        required this.phoneNumber
      }
    );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 255, 181),
          title: Center(
            child: Text(
                "Data Show Page",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                  
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "First Name:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        fname.isEmpty ? "No First Name Enter" :fname,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Last Name:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        lname.isEmpty ? "No Last Name Enter" :lname,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Age:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        age.isEmpty ? "No Age Enter" :age,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Phone Number:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        phoneNumber.isEmpty ? "No Phone Number Enter" :phoneNumber,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: Text(
                        "Add Data",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
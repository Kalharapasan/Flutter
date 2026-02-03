import 'package:flutter/material.dart';

class AppSecondPage extends StatelessWidget {
  final double finalAmount;

  AppSecondPage(this.finalAmount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F2F7),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Final Rider Earnings",
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text("Your Earnings for This Delivery:"),

            SizedBox(height: 15),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Rs. ${finalAmount.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            Text("This amount includes the optional tip."),
          ],
        ),
      ),
    );
  }
}


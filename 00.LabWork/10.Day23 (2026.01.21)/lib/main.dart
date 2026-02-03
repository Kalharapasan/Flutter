import 'package:flutter/material.dart';
import 'package:seu_is_20_ict_069/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<HomePage> {
  TextEditingController distance = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController tip = TextEditingController();

  double baseFare = 0;
  double commission = 0;

  void calculate() {
    double d = double.parse(distance.text);
    double r = double.parse(rate.text);

    baseFare = d * r;
    commission = baseFare * 0.02;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F2F7),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Rider Earnings Estimator",
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Image.asset("assets/images/delivery.png", height: 180),

            SizedBox(height: 20),


          TextField(
              controller: distance,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Distance (km)",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: rate,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Rate per km (Rs)",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: tip,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tip Amount (Optional)",
                border: OutlineInputBorder(),
              ),
            ),


            SizedBox(height: 20),

            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Base Fare"),
                        Text("Rs. ${baseFare.toStringAsFixed(2)}"),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Platform Commission (2%)"),
                        Text("Rs. ${commission.toStringAsFixed(2)}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: calculate,
                  child: Text("Calculate Earnings",
                      style: TextStyle(color: Colors.black)),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 47, 186, 201),
                  ),
                  onPressed: () {
                    double t = tip.text.isEmpty ? 0 : double.parse(tip.text);
                    double finalAmount =
                        (baseFare - commission) + t;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AppSecondPage(finalAmount),
                      ),
                    );
                  },
                  child: Text("View Final Earnings"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

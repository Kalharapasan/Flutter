import 'package:flutter/material.dart';
import 'package:test06/screen/showData.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final fname = TextEditingController();
  final lname = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();

  List<Map<String, String>> dataList = [];

  void addData() {
    dataList.add({
      "fname": fname.text,
      "lname": lname.text,
      "age": age.text,
      "phone": phone.text,
    });

    fname.clear();
    lname.clear();
    age.clear();
    phone.clear();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShowDataScreen(dataList: dataList),
      ),
    );
  }

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    age.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Data")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: fname,
              decoration: const InputDecoration(labelText: "First Name"),
            ),
            TextField(
              controller: lname,
              decoration: const InputDecoration(labelText: "Last Name"),
            ),
            TextField(
              controller: age,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            TextField(
              controller: phone,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addData,
              child: const Text("Save & Show"),
            ),
          ],
        ),
      ),
    );
  }
}

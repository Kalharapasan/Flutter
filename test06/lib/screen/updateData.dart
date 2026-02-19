import 'package:flutter/material.dart';

class UpdateDataScreen extends StatefulWidget {
  final Map<String, String> data;

  const UpdateDataScreen({super.key, required this.data});

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  late TextEditingController fname;
  late TextEditingController lname;
  late TextEditingController age;
  late TextEditingController phone;

  @override
  void initState() {
    super.initState();
    fname = TextEditingController(text: widget.data["fname"]);
    lname = TextEditingController(text: widget.data["lname"]);
    age = TextEditingController(text: widget.data["age"]);
    phone = TextEditingController(text: widget.data["phone"]);
  }

  void updateData() {
    widget.data["fname"] = fname.text;
    widget.data["lname"] = lname.text;
    widget.data["age"] = age.text;
    widget.data["phone"] = phone.text;

    Navigator.pop(context);
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
      appBar: AppBar(title: const Text("Update Data")),
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
              onPressed: updateData,
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateDataScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const UpdateDataScreen({super.key, required this.data});

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  late TextEditingController fname;
  late TextEditingController lname;
  late TextEditingController age;
  late TextEditingController phone;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    fname = TextEditingController(text: widget.data["fname"]);
    lname = TextEditingController(text: widget.data["lname"]);
    age = TextEditingController(text: widget.data["age"]);
    phone = TextEditingController(text: widget.data["phone"]);
  }

  Future<void> updateData() async {
    await supabase.from('student').update({
      "fname": fname.text,
      "lname": lname.text,
      "age": age.text,
      "phone": phone.text,
    }).eq('id', widget.data['id']);

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
              decoration: const InputDecoration(labelText: "First Name",border: OutlineInputBorder()),
            ),
            TextField(
              controller: lname,
              decoration: const InputDecoration(labelText: "Last Name",border: OutlineInputBorder()),
            ),
            TextField(
              controller: age,
              decoration: const InputDecoration(labelText: "Age",border: OutlineInputBorder()),
            ),
            TextField(
              controller: phone,
              decoration: const InputDecoration(labelText: "Phone",border: OutlineInputBorder()),
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
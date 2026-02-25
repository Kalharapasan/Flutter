import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test07/screen/showData.dart';


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

  final supabase = Supabase.instance.client;

  Future<void> addData() async {
    await supabase.from('student').insert({
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
        builder: (context) => const ShowDataScreen(),
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
              onPressed: addData,
              child: const Text("Save & Show"),
            ),
          ],
        ),
      ),
    );
  }
}
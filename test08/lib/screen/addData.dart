import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test08/screen/showData.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final fname = TextEditingController();
  final lname = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();

  double rating = 3;
  bool isActive = false;
  String gender = "Male";
  String department = "IT";

  final supabase = Supabase.instance.client;

  Future<void> addData() async {
    await supabase.from('studentII').insert({
      "fname": fname.text,
      "lname": lname.text,
      "age": age.text,
      "phone": phone.text,
      "rating": rating.toInt(),
      "is_active": isActive,
      "gender": gender,
      "department": department,
    });

    fname.clear();
    lname.clear();
    age.clear();
    phone.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data Added Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Data")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            TextField(controller: fname,
              decoration: const InputDecoration(labelText: "First Name", border: OutlineInputBorder())),
            const SizedBox(height: 10),

            TextField(controller: lname,
              decoration: const InputDecoration(labelText: "Last Name", border: OutlineInputBorder())),
            const SizedBox(height: 10),

            TextField(controller: age,
              decoration: const InputDecoration(labelText: "Age", border: OutlineInputBorder())),
            const SizedBox(height: 10),

            TextField(controller: phone,
              decoration: const InputDecoration(labelText: "Phone", border: OutlineInputBorder())),
            const SizedBox(height: 20),

            const Text("Rating"),
            Slider(
              value: rating,
              min: 1,
              max: 5,
              divisions: 4,
              label: rating.toString(),
              onChanged: (value) {
                setState(() => rating = value);
              },
            ),

            CheckboxListTile(
              title: const Text("Active Student"),
              value: isActive,
              onChanged: (value) {
                setState(() => isActive = value!);
              },
            ),

            const Text("Gender"),
            Row(
              children: [
                Radio(
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) => setState(() => gender = value.toString()),
                ),
                const Text("Male"),
                Radio(
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) => setState(() => gender = value.toString()),
                ),
                const Text("Female"),
              ],
            ),

            DropdownButtonFormField(
              value: department,
              items: const [
                DropdownMenuItem(value: "IT", child: Text("IT")),
                DropdownMenuItem(value: "CS", child: Text("CS")),
                DropdownMenuItem(value: "BCA", child: Text("BCA")),
              ],
              onChanged: (value) {
                setState(() => department = value.toString());
              },
              decoration: const InputDecoration(
                labelText: "Department",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: addData,
                    child: const Text("Add Data"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowDataScreen(),
                        ),
                      );
                    },
                    child: const Text("Show Data"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
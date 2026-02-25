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

  late double rating;
  late bool isActive;
  late String gender;
  late String department;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();

    fname = TextEditingController(text: widget.data["fname"]?.toString() ?? "");
    lname = TextEditingController(text: widget.data["lname"]?.toString() ?? "");
    age = TextEditingController(text: widget.data["age"]?.toString() ?? "");
    phone = TextEditingController(text: widget.data["phone"]?.toString() ?? "");

    rating = (widget.data["rating"] ?? 3).toDouble();
    isActive = widget.data["is_active"] ?? false;
    gender = widget.data["gender"] ?? "Male";
    department = widget.data["department"] ?? "IT";
  }

  Future<void> updateData() async {
    await supabase.from('studentII').update({
      "fname": fname.text,
      "lname": lname.text,
      "age": age.text,
      "phone": phone.text,
      "rating": rating.toInt(),
      "is_active": isActive,
      "gender": gender,
      "department": department,
    }).eq('id', widget.data['id']);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Data")),
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

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: updateData,
              child: const Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }
}
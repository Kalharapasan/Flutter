import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateData extends StatefulWidget {
  final Map<String, dynamic> data;

  const UpdateData({super.key, required this.data});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  late TextEditingController fnameController;
  late TextEditingController lnameController;
  late TextEditingController ageController;
  late TextEditingController gpaController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();

    fnameController = TextEditingController(text: widget.data['fname']);
    lnameController = TextEditingController(text: widget.data['lname']);
    ageController = TextEditingController(text: widget.data['age'].toString());
    gpaController = TextEditingController(text: widget.data['gpa'].toString());
    addressController = TextEditingController(text: widget.data['address']);
  }

  Future<void> updateData() async {
    await Supabase.instance.client
        .from('dataI')
        .update({
          'fname': fnameController.text,
          'lname': lnameController.text,
          'age': int.parse(ageController.text),
          'gpa': double.parse(gpaController.text),
          'address': addressController.text,
        })
        .eq('id', widget.data['id']);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Updated Successfully")));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    ageController.dispose();
    gpaController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Data"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: fnameController,
              decoration: const InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lnameController,
              decoration: const InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: gpaController,
              decoration: const InputDecoration(
                labelText: "GPA",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Address",
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

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateDataPage extends StatefulWidget {
  final dynamic item;

  UpdateDataPage({super.key, required this.item});

  @override
  _UpdateDataPageState createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.item['name']);
  }

  Future<void> updateData(int id, String name) async {
    try {
      await Supabase.instance.client
          .from('testDB')
          .update({'name': name})
          .eq('id', id);

      Navigator.pop(context); // Close the update page
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update data: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Data")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  updateData(widget.item['id'], nameController.text);
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}

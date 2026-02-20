import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test08/screen/updateData.dart';

class ShowDataScreen extends StatefulWidget {
  const ShowDataScreen({super.key});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await supabase.from('studentII').select();
    setState(() {
      dataList = List<Map<String, dynamic>>.from(response);
    });
  }

  Future<void> deleteData(int id) async {
    await supabase.from('studentII').delete().eq('id', id);
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data List")),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final data = dataList[index];

          return Card(
            child: ListTile(
              title: Text("${data['fname']} ${data['lname']}"),
              subtitle: Text(
                  "Age: ${data['age']} | Phone: ${data['phone']}\n"
                  "Rating: ${data['rating']} | Gender: ${data['gender']}\n"
                  "Dept: ${data['department']} | Active: ${data['is_active']}"),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateDataScreen(data: data),
                        ),
                      ).then((_) => fetchData());
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteData(data['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
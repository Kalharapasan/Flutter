import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test07/screen/updateData.dart';


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
    final response = await supabase.from('student').select();
    setState(() {
      dataList = List<Map<String, dynamic>>.from(response);
    });
  }

  Future<void> deleteData(int id) async {
    await supabase.from('student').delete().eq('id', id);
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
              subtitle:
                  Text("Age: ${data['age']} | Phone: ${data['phone']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateDataScreen(data: data),
                        ),
                      );
                      fetchData();
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
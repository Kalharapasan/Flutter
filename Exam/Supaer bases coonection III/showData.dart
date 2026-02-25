import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'updateData.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await Supabase.instance.client
        .from('dataI')
        .select()
        .order('id');

    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> deleteData(int id) async {
    await Supabase.instance.client.from('dataI').delete().eq('id', id);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Deleted Successfully")));

    setState(() {}); // refresh list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: const Text(
          "Show Data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          if (data.isEmpty) {
            return const Center(child: Text("No Data Found"));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text("${item['fname']} ${item['lname']}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Age: ${item['age']}"),
                      Text("GPA: ${item['gpa']}"),
                      Text("Address: ${item['address']}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateData(data: item),
                            ),
                          ).then((value) => setState(() {}));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteData(item['id']),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

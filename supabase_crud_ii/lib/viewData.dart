import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'updateDataPage.dart';

class ViewData extends StatelessWidget {
  const ViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data"),
      ),
      body: ViewPageBody(),
    );
  }
}

class ViewPageBody extends StatefulWidget {
  const ViewPageBody({super.key});

  @override
  State<ViewPageBody> createState() => _ViewPageBodyState();
}

class _ViewPageBodyState extends State<ViewPageBody> {
  List data = []; // To save the data
  bool isLoading = true; // Flag to check Data State
  String errorMessage = ""; // To store error messages

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // View Data Function
  Future<void> fetchData() async {
    try {
      final response = await Supabase.instance.client
          .from("testDB") // Table name
          .select() // Get all rows
          .order('id', ascending: false); // Newest data first

      setState(() {
        data = response;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to load data: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Delete Data Function
  Future<void> deleteData(int id) async {
    try {
      await Supabase.instance.client
          .from('testDB')
          .delete()
          .eq('id', id);

      fetchData(); // Refresh the data after deletion
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete data: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(child: Text("Error: $errorMessage"));
    }

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return ListTile(
          title: Text(item['name'] ?? 'No Name'),
          subtitle: Text(item['id'].toString()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateDataPage(item: item),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteData(item['id']); // Directly delete the item
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

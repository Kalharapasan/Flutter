import 'package:flutter/material.dart';
import 'package:test06/screen/updateData.dart';

class ShowDataScreen extends StatefulWidget {
  final List<Map<String, String>> dataList;

  const ShowDataScreen({super.key, required this.dataList});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data List")),
      body: ListView.builder(
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          final data = widget.dataList[index];

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
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        widget.dataList.removeAt(index);
                      });
                    },
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

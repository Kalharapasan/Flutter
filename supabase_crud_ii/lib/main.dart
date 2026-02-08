import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'viewData.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dmqlgfdhpywddxkgwfkx.supabase.co',
    anonKey: 'sb_publishable_ROv6h2qqZ7tTdE0S43V3dg_3RQCgvx_',
  );
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supabase Test"),
        backgroundColor: Colors.amber,
      ),
      body: AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  TextEditingController nameController = TextEditingController();

  Future<void> saveData() async {
    if (nameController.text.isEmpty) return;
    await Supabase.instance.client.from('testDB').insert({
      'name': nameController.text,
    });
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Enter Your Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: saveData,
            child: Text("Save Data"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewData()),
              );
            },
            child: Text("View Data"),
          )
        ],
      ),
    );
  }
}

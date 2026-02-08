import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/item_list_page.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://dmqlgfdhpywddxkgwfkx.supabase.co',
    anonKey: 'sb_publishable_ROv6h2qqZ7tTdE0S43V3dg_3RQCgvx_',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListPage(),
    );
  }
}

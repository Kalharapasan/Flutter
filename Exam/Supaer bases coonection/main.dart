import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test07/screen/addData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dmqlgfdhpywddxkgwfkx.supabase.co',
    anonKey: 'sb_publishable_ROv6h2qqZ7tTdE0S43V3dg_3RQCgvx_',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddDataScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test15/addData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dmqlgfdhpywddxkgwfkx.supabase.co',
    anonKey: 'sb_publishable_ROv6h2qqZ7tTdE0S43V3dg_3RQCgvx_',
  );

  runApp(MyApp());
}




//flutter pub add supabase_flutter
//supabase_flutter: ^2.12.0
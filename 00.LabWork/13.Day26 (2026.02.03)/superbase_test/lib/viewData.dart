import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  List data = []; //To save the data
  bool isLoading = true; //Aflag to check Data State

  @override
  void initState() {
    //load data automatically  when page
    super.initState();
    fetchData();
  }

  //View Data Function
  Future <void> fetchData () async{
    final response = await Supabase.instance.client
    .from("testDB")//table anme
    .select()//get all row
    .order('id',ascending: false);//newset data first

    setState(() {
      data = response;//from response to created empty list
      isLoading=false;//stop loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

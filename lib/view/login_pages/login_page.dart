import 'package:flutter/material.dart';

class loging_page extends StatefulWidget {
  const loging_page({super.key});

  @override
  State<loging_page> createState() => _loging_pageState();
}

class _loging_pageState extends State<loging_page> {
  @override
  late GlobalKey<void> _formkey = _formkey;
  TextEditingController _enterName = TextEditingController();
  TextEditingController _password = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
            key: _formkey,
            children: [
        TextField(

        decoration: InputDecoration(
        label: Text("Enter Email"),
      ),
    ),
    TextField(
    decoration: InputDecoration(
    label: Text("Enter password"),
    ),

    ),

    ElevatedButton(onPressed: (){
    }, child: Text("Login Here")),
    ],
    ),
    )
    );
  }
}

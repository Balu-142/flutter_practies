import 'package:flutter/material.dart';
import 'package:practices/view/example_screens/image_slider.dart';
import 'package:practices/view/interview/bottom_navbar.dart';

class Exampal extends StatefulWidget {
  const Exampal({super.key});

  @override
  State<Exampal> createState() => _ExampalState();
}

class _ExampalState extends State<Exampal> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Email"),
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "plese enter valid email";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter password")
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "plses enter pasword";
                    }
                    if(value.length <6){
                      return "must be geter then 6 ";
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BotanNavbar()),
                    );
                  }
                },
                  child: Text("Next"),

              ),
            ],

        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practices/view/face_recagnice_app/camera_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register_page extends StatelessWidget {
  const Register_page({super.key});


  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey= GlobalKey();
    final TextEditingController _namecontroller = TextEditingController();
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();
    final TextEditingController _conformpasswordcontroller = TextEditingController();

    return  Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(" register page",style: TextStyle(color: Colors.green),),),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter You Are Name "),
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Name should not be Empty";
                  }
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Your are EmailId "),
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Name should not be Empty";
                  }
                  if(value.length<6){
                    return "password must be 6";
                  }
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _passwordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter You are password "),
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Name should not be Empty";
                  }
                  if(value.length<6){
                    return "password must be 6";
                  }
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _conformpasswordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Emter password "),
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Name should not be Empty";
                  }
                  if(value.length<6){
                    return "password must be 6";
                  }
                },
              ),
            ),

            ElevatedButton(onPressed:  () async {
              if(_formKey.currentState!.validate()){
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('name', _namecontroller.text);
                await prefs.setString('Email', _emailcontroller.text);
                await prefs.setString('password', _passwordcontroller.text);
                await prefs.setString('ConformPassword', _conformpasswordcontroller.text);

                Navigator.push(context, MaterialPageRoute(builder: (_)=>CameraScreen())) ;
              }
            }, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}

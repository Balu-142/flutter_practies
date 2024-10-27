import 'package:flutter/material.dart';
import 'package:practices/view/face_recagnice_app/camera_page.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Buttom Example"),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Button"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>CameraScreen()));
            },
          ),
        )
    );
  }
}

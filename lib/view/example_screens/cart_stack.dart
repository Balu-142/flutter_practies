import 'package:flutter/material.dart';
import 'package:practices/view/example_screens/image_slider.dart';

class cardStack extends StatelessWidget {
  const cardStack({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("card Stack"),
      ),
      body: ListView(
        children: [
          ImagePage(),
          Container(
            child: Text("welcome"),

          )
        ],
      ),
    );
  }
}

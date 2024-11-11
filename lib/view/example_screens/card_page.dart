import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Card_page_stack extends StatefulWidget {
  const Card_page_stack({super.key});

  @override
  State<Card_page_stack> createState() => _Card_page_stackState();
}

class _Card_page_stackState extends State<Card_page_stack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stak page"),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.cyanAccent,
            margin: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Image.asset('images/balu.png',width: 100,height: 100,),
                Positioned(
                  left: MediaQuery.sizeOf(context).width*0.3,
                    top: MediaQuery.sizeOf(context).width*0.03,
                    child: Text("Balu",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)
                ),
                // SizedBox(height:MediaQuery.sizeOf(context).height*0.3 ),
                Positioned(
                    left: MediaQuery.sizeOf(context).width*0.3,
                    top: MediaQuery.sizeOf(context).width*0.1,
                    child: Text("Flutter devloper",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
                ),
                Positioned(
                    left: MediaQuery.sizeOf(context).width*0.3,
                    top: MediaQuery.sizeOf(context).width*0.1,
                    right: MediaQuery.sizeOf(context).width*0.1,
                    bottom: MediaQuery.sizeOf(context).width*-0.2,
                    child: ElevatedButton(onPressed: (){},child: Text("Click"),),
                ),
              ],
            ),
          ),
          // Container(
          //   color: Colors.blue, // Background color for visibility
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.5), // -50% offset
          //     child: ElevatedButton(
          //       onPressed: () {
          //         // Your button action here
          //         print('Button Pressed!');
          //       },
          //       child: Text('Elevated Button'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

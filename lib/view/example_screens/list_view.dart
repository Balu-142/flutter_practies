// import 'package:flutter/material.dart';
//
// import '../profile/men_page.dart';
// import '../profile/women_page.dart';
//
// class Horizental_List extends StatelessWidget {
//   final List<String> items=[
//     'Item1',
//     'Item2',
//     'Item3',
//     'Item4',
//     'Item5',
//     'Item6',
//     'Item7',
//     'Item8',
//   ];
//
//    Horizental_List({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//       )
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:practices/view/example_screens/BottomSheet_page.dart';
import 'package:practices/view/example_screens/otp_verification.dart';
import 'package:practices/view/interview/sos_page.dart';

class Horizental_List extends StatelessWidget {
  // Horizental_List({super.key});
  final List<String> items =[
    'Men',
    'women',
    'Item3',
    'Item3',
    'Item3',
    'Item3',
    'Item3'

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Horizental Scroll Bar"),
      ),
      body: Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount:items.length,
            itemBuilder: (context,count){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
              onTap: (){
               switch (count) {
                 case 0:
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>SosPage()));
                   break;
                 case 1:
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>SosPage()));
                   break;
                 case 2:
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>SosPage()));
                   break;

                   default: break;
               }
              },
              child: Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                  // shape: BoxShape.sq,
                  color: Colors.cyan
                ),
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Center(
                  child: Text(
                    items[count],
                    style: TextStyle(color: Colors.black),
                  ),
                ),

              ),
                          ),
            );
            }
        ),
      ),
    );
  }
}

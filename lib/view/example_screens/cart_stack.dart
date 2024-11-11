import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.4,
                child:
                Image.asset('assets/images/balu.png', fit: BoxFit.cover),
              ),
            ),
            Container(
              color: Color.fromRGBO(5, 65, 196, 0.19),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 40,bottom: 230 ),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Meet \nYour Doctor\nHere', style:TextStyle(
                    height: 1.2,
                    fontFamily: 'Dubai',
                    fontSize: 35,
                    color:Color(0xffFAFAFA),
                    fontWeight: FontWeight.w500,
                  ))),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,top: 26),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('DOCTOR', style:TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: 30,
                    color:Colors.white,
                    fontWeight: FontWeight.w500,
                  ))),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child:  SizedBox(
                    width: 320,
                    height: 65,
                    child: ElevatedButton(
                        onPressed: () {
                        },
                        child: Text('Get Started',style:TextStyle(color:Colors.white,fontSize:25, fontWeight: FontWeight.normal),
                        ),
                        style:ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff05ABA3)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            )
                        )
                    ),
                  )
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      height: 5,
                      width: 120,
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

}
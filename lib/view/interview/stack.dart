import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  const StackPage({super.key});

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0), 
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(12.0), 
              border: Border.all(
                color: Colors.blue, 
                width: 2.0, 
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), 
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Starts in 10 min"),
                      Row(
                        children: [
                          Image.asset(
                            'assets/image2.png',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 8.0), 
                          const Text("Dr. Ashutosh Misra"),
                        ],
                      ),
                      const SizedBox(height: 8.0), 
                    ],
                  ),
                  Positioned(
                    bottom: -10.0, 
                    left: 0,
                    right: MediaQuery.sizeOf(context).width* 0.8, 
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text("Pay 200"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, 
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

    const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Expanded(child: Divider(),), 
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Icon(Icons.notifications), 
    ),
    Expanded(child: Divider()), 
    ],
    ),

    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(
    width: MediaQuery.sizeOf(context).width *0.6, 
    child: Divider(
    thickness: 2, 
    color: Colors.black, 
    ),
    ),
    const Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Icon(Icons.notifications, size: 24), 
    ),
    SizedBox(
      width: MediaQuery.sizeOf(context).width *0.1, 
    child: Divider(
    thickness: 2, 
    color: Colors.black, 
    ),
    ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(Icons.person_rounded, size: 24), 
      ),
     
    ],
    ),


        ],
      ),
    );
  }
}

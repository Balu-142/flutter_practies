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
            margin: const EdgeInsets.all(8.0), // Add margin for spacing
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(12.0), // Border radius
              border: Border.all(
                color: Colors.blue, // Border color
                width: 2.0, // Border width
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding for text layout
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
                          const SizedBox(width: 8.0), // Spacing between image and text
                          const Text("Dr. Ashutosh Misra"),
                        ],
                      ),
                      const SizedBox(height: 8.0), // Add spacing
                    ],
                  ),
                  Positioned(
                    bottom: -10.0, // Distance from the bottom
                    left: 0,
                    right: MediaQuery.sizeOf(context).width* 0.8, // Make it stretch across the width
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button action here
                      },
                      child: const Text("Pay 200"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Expanded(child: Divider(),), // Left line
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Icon(Icons.notifications), // Your icon here
    ),
    Expanded(child: Divider()), // Right line
    ],
    ),

    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    width: MediaQuery.sizeOf(context).width *0.6, // Customize the width of the left line
    child: Divider(
    thickness: 2, // Line thickness
    color: Colors.black, // Line color
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Icon(Icons.notifications, size: 24), // Your icon here
    ),
    Container(
      width: MediaQuery.sizeOf(context).width *0.1, // Customize the width of the left line
    child: Divider(
    thickness: 2, // Line thickness
    color: Colors.black, // Line color
    ),
    ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(Icons.person_rounded, size: 24), // Your icon here
      ),
      // Container(
      //   width: MediaQuery.sizeOf(context).width *0.1, // Customize the width of the left line
      //   child: Divider(
      //     thickness: 2, // Line thickness
      //     color: Colors.black, // Line color
      //   ),
      // ),
    ],
    ),


        ],
      ),
    );
  }
}

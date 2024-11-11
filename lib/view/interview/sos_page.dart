import 'package:flutter/material.dart';

class SosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String username = "name"; 

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Kartik",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth > 600 ? 20 : 16,
                  ),
                ),
                Text(
                  "Let’s see your heart’s streak today",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: screenWidth > 600 ? 16 : 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.green.shade200,
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add_rounded),
            onPressed: () {
              print("notification_add_rounded");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Card(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Your SOS request has been raised",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ambulance Arriving in 6 Minutes",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Heading towards the patient",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.location_on_rounded, size: 20, color: Colors.blue),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.car_repair_rounded, size: 20.0, color: Colors.blue),
                      SizedBox(width: 16),
                      Icon(Icons.person, size: 20.0, color: Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Doctor is here to help you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image2.png'), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: Colors.black54, 
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 16,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Text(
                      username, 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 

                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.mic, color: Colors.black),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.video_call, color: Colors.black),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.call_end, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share_sharp),
                          SizedBox(width: 8),
                          Text("Share Report"),
                        ],
                      ),
                    ),

                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.question_mark_rounded),
                          SizedBox(width: 8),
                          Text("Any Queries"),
                        ],
                      ),
                    ),
                  ],
                  indicatorColor: Colors.green,
                ),
                Divider(), 
                
                SizedBox(
                  height: 100,
                  child: TabBarView(
                    children: [
                      Center(child: Text("Share Report")),
                      Center(child: Text("Any Queries")),
                    ],
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

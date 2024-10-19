import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:practices/view/interview/sos_page.dart';

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

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
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: double.infinity, // This makes the Card take the full width
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  side: BorderSide(color: Colors.blue, width: 2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Emergency help needed?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Just hold the button to call",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center, // Center the overlay image
                      children: [
                        // Background image
                        Image.asset(
                          'assets/hart.png',
                          height: 100,
                          width: 100,
                        ),
                        // Overlay image
                        GestureDetector(
                          onTap: () {
                            // Handle the tap event
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SosPage()),
                            );
                          },
                          child: Image.asset(
                            'assets/SOS.png', // Your overlay image
                            height: 50, // Adjust size as needed
                            width: 50, // Adjust size as needed
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),



          // Risk Assessment Card
          Center(
          child: Card(
          shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
          alignment: Alignment.center, // Center aligns children
          children: [
          Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Icon(
          Icons.warning,
          color: Colors.blue,
    size: 40,
    ),
    SizedBox(width: 20),
    Expanded(
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Text(
    "Risk\nAssessment",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 18),
    ),
    SizedBox(height: 20),
    ],
    ),
    ),
    SizedBox(width: 20),
    CircularPercentIndicator(
    radius: 40,
    animation: true,
    animationDuration: 1200,
    lineWidth: 15.0,
    percent: 0.65,
    center: Text(
    "65%",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    ),
    ),
    circularStrokeCap: CircularStrokeCap.round,
    backgroundColor: Colors.yellow,
    progressColor: Colors.red,
    ),
    ],
    ),
    SizedBox(height: 20),
    ],
    ),
    Positioned(
    top: 50, // Adjust this value as needed for positioning
    child: Padding(
    padding: const EdgeInsets.all(8.0), // Add your desired padding
    child: ElevatedButton(
    onPressed: () {
    // Define your button action here
    },
    child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    Text("Calculate"),
    SizedBox(width: 8),
    Icon(Icons.arrow_forward),
    ],
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    ),



    Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Scheduled Appointment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 60),
                Text(
                  "View All",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Adds space between the previous row and the PageView

          // First PageView
          SizedBox(
            height: 200, // Set height for the PageView
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Card(
                  child: Image.asset('assets/image1.png'), // Replace with your images
                ),
                Card(
                  child: Image.asset('assets/image2.png'),
                ),
                Card(
                  child: Image.asset('assets/image3.png'),
                ),
              ],
            ),
          ),


          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "How it Helps",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 180),
                Text(
                  "View All",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Adds space between the previous row and the PageView

          // Second PageView
          SizedBox(
            height: 200, // Set height for the PageView
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Card(
                  child: Image.asset('assets/side21.jpg', fit: BoxFit.cover), // Replace with your images
                ),
                Card(
                  child: Image.asset('assets/image2.png', fit: BoxFit.cover),
                ),
                Card(
                  child: Image.asset('assets/side21.jpg', fit: BoxFit.cover),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

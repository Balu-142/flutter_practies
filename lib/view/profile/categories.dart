import 'package:flutter/material.dart';
import 'package:practices/view/profile/women_page.dart';
import 'package:practices/view/profile/men_page.dart'; // Import your Men page

class MyCarousel extends StatelessWidget {
  final List<String> items = [
    'Women_Products',
    'Men_Products',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Add padding for better spacing
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                // Navigate to different pages based on the selected item
                if (item == 'Women_Products') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Women_Products(),
                    ),
                  );
                } else if (item == 'Men_Products') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Men_Products(),
                    ),
                  );
                } else {
                  // Handle other items accordingly
                  print('Tapped on $item');
                }
              },
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center, // Center the text
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

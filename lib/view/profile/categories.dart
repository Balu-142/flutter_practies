import 'package:flutter/material.dart';
import 'package:practices/view/interview/bottom_nav.dart';
import 'package:practices/view/profile/men_page.dart';
import 'package:practices/view/profile/women_page.dart';

class CategoriesPage1 extends StatefulWidget {
  const CategoriesPage1({super.key});

  @override
  State<CategoriesPage1> createState() => _CategoriesPage1State();
}

class _CategoriesPage1State extends State<CategoriesPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Welcome")),
      ),
      body: Container(
        child: Wrap(
          spacing: 10.0, // Space between the cards
          runSpacing: 10.0, // Space between rows of cards
          alignment: WrapAlignment.center, // Center the cards
          children: [
            Card(
              child: GestureDetector(
                onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (_)=>Men_Products()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Padding inside the card
                  child: Text("Men"),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Women_Products()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Women"),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () {
                  // Your onTap logic here
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Electric"),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () {
                  // Your onTap logic here
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Gold"),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

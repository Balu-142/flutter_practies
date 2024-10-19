import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile Page")),
        backgroundColor: Colors.green.shade200,
        actions: [
          IconButton(
            icon: Icon(Icons.settings), // Example action icon
            onPressed: () {
              // Action when the icon is pressed
              print("Settings pressed");
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Profile Content Here",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

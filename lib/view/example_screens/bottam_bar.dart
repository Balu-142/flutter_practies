import 'package:flutter/material.dart';
import 'package:practices/view/example_screens/BottomSheet_page.dart';
import 'package:practices/view/example_screens/cart_stack.dart';
import 'package:practices/view/example_screens/image_slider.dart';
import 'package:practices/view/example_screens/list_view.dart';
import 'package:practices/view/example_screens/login_form.dart';

class BottonBar extends StatefulWidget {
  const BottonBar({super.key});

  @override
  State<BottonBar> createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages= [
      // ImagePage(),
      LoginForm(),
      Horizental_List(),
      BottomSheet_page(),
      GetStarted(),
    ];

    void _onItemTap(int index){
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: Container(
         child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:_onItemTap ,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.yellowAccent,
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "camera"),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Bottam"),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Setteings"),
      ],
      ),
    );
  }
}

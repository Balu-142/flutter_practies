import 'package:flutter/material.dart';
import 'package:practices/view/example_screens/cart_stack.dart';
import 'package:practices/view/example_screens/login_list.dart';
import 'package:practices/view/example_screens/stack/card%20_stack.dart';
import 'package:practices/view/face_recagnice_app/Button_page.dart';
import 'package:practices/view/interview/home_page.dart';
import 'package:practices/view/interview/stack.dart';
import 'package:practices/view/login_list.dart';
import 'package:practices/view/profile/profile.dart';
import 'package:practices/view/profile/provider/Myorder_page.dart';
import 'package:practices/view/profile/provider/cart_screen.dart';

import '../example_screens/BottomSheet_page.dart';
import '../profile/products_view.dart';

class BotanNavbar extends StatefulWidget {

  const BotanNavbar({super.key});

  @override
  State<BotanNavbar> createState() => _BotanNavbarState();
}
class _BotanNavbarState extends State<BotanNavbar> {

  int _selectedIndex =0;

  final List<Widget> _pages=[
    // Home_page(),
    Products(),
    // BottomSheet_page(),
    // ButtonPage(),
    // Login_page_data(),
    CartPage(),
    OrderPage(),
    Profile_page()
  ];

  void _onItemTap(int index){
    setState((){
       _selectedIndex =index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   title: Text("Botam bar"),
      // ),
        body:Center(
          child:_pages[_selectedIndex],
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "My Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),

        ],

      ),
    );
  }
}

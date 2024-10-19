import 'package:flutter/material.dart';
import 'package:practices/view/example_screens/cart_stack.dart';
import 'package:practices/view/example_screens/image_slider.dart';
import 'package:practices/view/interview/sos_page.dart';
import 'package:practices/view/login_list.dart';
import 'package:practices/view/profile/categories.dart';
import 'package:practices/view/profile/post_products.dart';
import 'package:practices/view/profile/products_view.dart';
import 'package:practices/view/profile/profile.dart';
import 'package:practices/view/services_list.dart';
import 'package:practices/view/sportfy_songs_List.dart';

import 'view/interview/bottom_nav.dart';
import 'view/profile/notificaton.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: BottomNavBar(), //impo
      // home: ServicesList(),
      // home : LoginList(),
      // home: SongsList(),
      // home: ProfilePage(),
      // home: Products(),
      // home: CategoriesPage(),

      // home:PostProductScreen(),
      // home: BottomNavBar()
      //   home: CategoriesPage1(),
      // home: Notification_page(),

      // home: ImagePage(),
       home:  cardStack(),

       // home: SosPage()





    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:practices/view/post_data.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dio POST Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final _formKey = GlobalKey<FormState>();
//   String name = '';
//   String mobile = '';
//   String email = '';
//   String responseMessage = '';
//
//   Future<void> sendData() async {
//     if (_formKey.currentState!.validate()) {
//       final response = await ApiService.sendData(name, mobile, email);
//       setState(() {
//         responseMessage = response;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dio POST Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     name = value;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Mobile'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your mobile number';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     mobile = value;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Email'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                       return 'Please enter a valid email address';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     email = value;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: sendData,
//                   child: Text('Send Data'),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   responseMessage,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

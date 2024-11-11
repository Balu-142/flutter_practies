import 'package:flutter/material.dart';
import 'package:practices/view/example_screens/bottam_bar.dart';
import 'package:practices/view/example_screens/card_page.dart';
import 'package:practices/view/example_screens/login_list.dart';
import 'package:practices/view/example_screens/stack/card%20_stack.dart';
import 'package:practices/view/face_app/map_integreate.dart';
import 'package:practices/view/face_recagnice_app/Regester_page.dart';
import 'package:practices/view/face_recagnice_app/camera_page.dart';
import 'package:practices/view/interview/bottom_navbar.dart';
import 'package:practices/view/login_pages/login_page.dart';
import 'package:practices/view/profile/provider/cart_provider.dart';
import 'package:practices/view/profile/provider/order_provider.dart';
import 'package:practices/view/profile/rezorpay_integration.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/face_recagnice_app/Button_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => CartProvider()),
        ChangeNotifierProvider(
            create: (context) => OrderProvider()),
      ],
      child: MaterialApp(
        title: 'Camera App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        // home: ButtonPage(),

        // home:BotanNavbar(),
        home:Profile_page(),

        // FutureBuilder<bool>(
        //   future: _isRegistered(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasData && snapshot.data == true) {
        //       return CameraScreen();
        //     } else {
        //       return Register_page();
        //     }
        //   },
        // ),
      ),
    );
  }
  // Future<bool> _isRegistered() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? name = prefs.getString('name');
  //   return name != null;
  // }
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
//       title: 'API Data Submission',
//       home: DataSubmissionPage(),
//     );
//   }
// }
//
// class DataSubmissionPage extends StatefulWidget {
//   @override
//   _DataSubmissionPageState createState() => _DataSubmissionPageState();
// }
//
// class _DataSubmissionPageState extends State<DataSubmissionPage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   String _responseMessage = '';
//
//   void _submitData() async {
//     String name = _nameController.text;
//     String mobile = _mobileController.text;
//     String email = _emailController.text;
//
//     String response = await ApiService.sendData(name, mobile, email);
//     setState(() {
//       _responseMessage = response;
//       print('response: $response');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Submit Data'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _mobileController,
//               decoration: InputDecoration(labelText: 'Mobile'),
//               keyboardType: TextInputType.phone,
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submitData,
//               child: Text('Submit'),
//             ),
//             SizedBox(height: 20),
//             Text(_responseMessage),
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:practices/view/face_app/db_helper.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Storage App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ImageCaptureScreen(),
//     );
//   }
// }
//
// class ImageCaptureScreen extends StatefulWidget {
//   @override
//   _ImageCaptureScreenState createState() => _ImageCaptureScreenState();
// }
//
// class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
//   final ImagePicker _picker = ImagePicker();
//   final DbHelper _dbHelper = DbHelper();
//   List<String> _imagePaths = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImages();
//   }
//
//   Future<void> _loadImages() async {
//     final images = await _dbHelper.getImages();
//     setState(() {
//       _imagePaths = images.map((image) => image['imagePath'] as String).toList();
//     });
//   }
//
//   Future<void> _captureImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       await _dbHelper.insertImage(image.path);
//       _loadImages();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Capture and Store Images'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _imagePaths.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: Image.file(File(_imagePaths[index])),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _captureImage, // Directly call the capture function
//             child: Text('Capture Image'),
//           ),
//         ],
//       ),
//     );
//   }
// }









// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:practices/view/Fcm_page/ex.dart';
// import 'package:practices/view/Fcm_page/fcm_notification.dart';
// import 'package:practices/view/face_app/image_captcher.dart';
// import 'package:practices/view/interview/bottom_nav.dart';
//
// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: FcmNotification(),
//       home: ImageCaptureScreen(),
//       // home:BottomNavBar(),
//     );
//   }
// }






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

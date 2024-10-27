// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class FcmNotification extends StatefulWidget {
//   @override
//   _FcmNotificationState createState() => _FcmNotificationState();
// }
//
// class _FcmNotificationState extends State<FcmNotification> {
//   String? _token;
//
//   @override
//   void initState() {
//     super.initState();
//     _getToken();
//   }
//
//   Future<void> _getToken() async {
//     String? token = await FirebaseMessaging.instance.getToken();
//     setState(() {
//       _token = token;
//     });
//     print("FCM Token: $_token");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("FCM Token Example")),
//       body:
//       Center(
//         child: Text(_token != null ? "Token: $_token" : "Getting Token..."),
//       ),
//
//     );
//   }
// }
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:practices/view/face_app/database_page.dart';
//
// class ImageCaptureScreen extends StatefulWidget {
//   @override
//   _ImageCaptureScreenState createState() => _ImageCaptureScreenState();
// }
//
// class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
//   String? _imagePath;
//
//   Future<void> _captureImage() async {
//     // Initialize the camera
//     final cameras = await availableCameras();
//     final firstCamera = cameras.first;
//
//     final CameraController controller = CameraController(
//       firstCamera,
//       ResolutionPreset.high,
//     );
//
//     await controller.initialize();
//
//     // Capture the image
//     final image = await controller.takePicture();
//
//     setState(() {
//       _imagePath = image.path;
//     });
//
//     // Dispose the controller
//     await controller.dispose();
//   }
//
//   Future<void> _saveFace(String name) async {
//     if (_imagePath != null) {
//       await DatabaseHelper().insertFace(name, _imagePath!);
//
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Face saved successfully!')),
//       );
//
//       // Reset the image path to allow taking a new picture
//       setState(() {
//         _imagePath = null; // Reset the image path
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Face Recognition')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_imagePath != null)
//               Container(
//                 height: screenHeight * 0.7, // 70% of the screen height
//                 width: double.infinity, // Full width
//                 child: Image.file(File(_imagePath!), fit: BoxFit.cover),
//               ),
//             ElevatedButton(
//               onPressed: _captureImage, // Capture image
//               child: Text('Take Picture'),
//             ),
//             if (_imagePath != null)
//               ElevatedButton(
//                 onPressed: () {
//                   // You can replace 'Unknown Name' with actual input
//                   _saveFace('Unknown Name');
//                 },
//                 child: Text('Save Face'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:practices/view/face_app/database_page.dart';
//
// class ImageCaptureScreen extends StatefulWidget {
//   @override
//   _ImageCaptureScreenState createState() => _ImageCaptureScreenState();
// }
//
// class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
//   String? _imagePath;
//   CameraController? _controller;
//   List<CameraDescription>? _cameras;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }
//
//   Future<void> _initializeCamera() async {
//     // Get the list of available cameras
//     _cameras = await availableCameras();
//
//     // Find the front camera
//     final frontCamera = _cameras!.firstWhere(
//           (camera) => camera.lensDirection == CameraLensDirection.front,
//       orElse: () => _cameras!.first, // Fallback to the first camera if no front camera found
//     );
//
//     // Initialize the controller
//     _controller = CameraController(
//       frontCamera,
//       ResolutionPreset.high,
//     );
//
//     await _controller!.initialize();
//     setState(() {});
//   }
//
//   Future<void> _captureImage() async {
//     if (_controller != null) {
//       // Capture the image
//       final image = await _controller!.takePicture();
//
//       setState(() {
//         _imagePath = image.path;
//       });
//     }
//   }
//
//   Future<void> _saveFace(String name) async {
//     if (_imagePath != null) {
//       await DatabaseHelper().insertFace(name, _imagePath!);
//
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Face saved successfully!')),
//       );
//
//       // Reset the image path to allow taking a new picture
//       setState(() {
//         _imagePath = null; // Reset the image path
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Face Recognition')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_imagePath != null)
//               Container(
//                 height: screenHeight * 0.7, // 70% of the screen height
//                 width: double.infinity, // Full width
//                 child: Image.file(File(_imagePath!), fit: BoxFit.cover),
//               ),
//             ElevatedButton(
//               onPressed: _captureImage, // Capture image
//               child: Text('Take Picture'),
//             ),
//             if (_imagePath != null)
//               ElevatedButton(
//                 onPressed: () {
//                   // You can replace 'Unknown Name' with actual input
//                   _saveFace('Unknown Name');
//                 },
//                 child: Text('Save Face'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

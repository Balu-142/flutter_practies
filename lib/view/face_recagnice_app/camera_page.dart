
// import 'dart:async';
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:practices/view/face_recagnice_app/camera_service.dart';
// import 'package:practices/view/face_recagnice_app/data_base.dart';
//
// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   CameraService cameraService = CameraService();
//   DatabaseHelper dbHelper = DatabaseHelper();
//   List<Map<String, dynamic>> faces = [];
//   XFile? image;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     cameraService.initCamera();
//     fetchFaces();
//     _startAutoCapture();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel(); // Cancel the timer
//     cameraService.dispose();
//     super.dispose();
//   }
//
//   Future<void> fetchFaces() async {
//     faces = await dbHelper.getFaces();
//     setState(() {});
//   }
//
//   void captureImage() async {
//     image = await cameraService.takePicture();
//     if (image != null) {
//       // Save the image to the database
//       await dbHelper.insertFace("Person Name", image!.path);
//       await fetchFaces(); // Refresh the list
//     }
//   }
//
//   void _startAutoCapture() {
//     _timer = Timer.periodic(Duration(seconds: 3), (timer) {
//       captureImage(); // Capture an image every 5 seconds
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Face Recognition App')),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder<void>(
//               future: cameraService.initCamera(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return CameraPreview(cameraService.controller!);
//                 }
//                 return Center(child: CircularProgressIndicator());
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: faces.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.file(
//                     File(faces[index]['imagePath']),
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(faces[index]['name']),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'dart:async';
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:practices/view/face_recagnice_app/Image_detailes.dart';
// import 'package:practices/view/face_recagnice_app/camera_service.dart';
// import 'package:practices/view/face_recagnice_app/data_base.dart';
//
// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   CameraService cameraService = CameraService();
//   DatabaseHelper dbHelper = DatabaseHelper();
//   List<Map<String, dynamic>> faces = [];
//   XFile? image;
//   Timer? _timer;
//   bool isCameraReady = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     fetchFaces();
//     _startAutoCapture();
//   }
//
//   Future<void> _initializeCamera() async {
//     await cameraService.initCamera();
//     setState(() {
//       isCameraReady = true; // Update state when camera is ready
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     cameraService.dispose();
//     super.dispose();
//   }
//
//   Future<void> fetchFaces() async {
//     faces = await dbHelper.getFaces();
//     setState(() {});
//   }
//
//   void captureImage() async {
//     image = await cameraService.takePicture();
//     if (image != null) {
//       await dbHelper.insertFace("Person Name", image!.path);
//       await fetchFaces();
//     }
//   }
//
//   void _startAutoCapture() {
//     _timer = Timer.periodic(Duration(seconds: 5), (timer) {
//       captureImage();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Face Recognition App')),
//       body: Column(
//         children: [
//           Expanded(
//             child: isCameraReady
//                 ? CameraPreview(cameraService.controller!)
//                 : Center(child: CircularProgressIndicator()), // Show progress only if the camera isn't ready
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: faces.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.file(
//                     File(faces[index]['imagePath']),
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(faces[index]['name']),
//                   onTap: () {
//                     // Navigate to the image detail page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ImageDetailPage(imagePath: faces[index]['imagePath']),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'dart:async';
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart'; // Import Google ML Kit
// import 'package:practices/view/face_recagnice_app/Image_detailes.dart';
// import 'package:practices/view/face_recagnice_app/camera_service.dart';
// import 'package:practices/view/face_recagnice_app/data_base.dart';
//
// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   CameraService cameraService = CameraService();
//   DatabaseHelper dbHelper = DatabaseHelper();
//   List<Map<String, dynamic>> faces = [];
//   XFile? image;
//   Timer? _timer;
//   bool isCameraReady = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     fetchFaces();
//     _startAutoCapture();
//   }
//
//   Future<void> _initializeCamera() async {
//     await cameraService.initCamera();
//     setState(() {
//       isCameraReady = true; // Update state when camera is ready
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     cameraService.dispose();
//     super.dispose();
//   }
//
//   Future<void> fetchFaces() async {
//     faces = await dbHelper.getFaces();
//     setState(() {});
//   }
//
//   void captureImage() async {
//     XFile? newImage = await cameraService.takePicture();
//     if (newImage != null) {
//       // Check for faces in the captured image using Google ML Kit
//       final inputImage = InputImage.fromFilePath(newImage.path);
//       final faceDetector = GoogleMlKit.vision.faceDetector();
//       final List<Face> detectedFaces = await faceDetector.processImage(inputImage);
//
//       if (detectedFaces.isNotEmpty) {
//         String personName = "Person Name"; // You may want to dynamically determine this
//         // Check if the person is already in the faces list based on the image path
//         bool exists = faces.any((face) => face['imagePath'] == newImage.path);
//         if (!exists) {
//           await dbHelper.insertFace(personName, newImage.path);
//           await fetchFaces();
//         } else {
//           // Optionally inform the user
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("This face has already been captured.")),
//           );
//         }
//       } else {
//         // If no face is detected, you may want to show a message or handle it
//         print("No face detected.");
//       }
//     }
//   }
//
//   void _startAutoCapture() {
//     _timer = Timer.periodic(Duration(seconds: 5), (timer) {
//       captureImage();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Face Recognition App')),
//       body: Column(
//         children: [
//           Expanded(
//             child: isCameraReady
//                 ? CameraPreview(cameraService.controller!)
//                 : Center(child: CircularProgressIndicator()), // Show progress only if the camera isn't ready
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: faces.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.file(
//                     File(faces[index]['imagePath']),
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(faces[index]['name']),
//                   onTap: () {
//                     // Navigate to the image detail page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ImageDetailPage(imagePath: faces[index]['imagePath']),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'dart:async';
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart'; // Import Google ML Kit
// import 'package:practices/view/face_recagnice_app/Image_detailes.dart';
// import 'package:practices/view/face_recagnice_app/camera_service.dart';
// import 'package:practices/view/face_recagnice_app/data_base.dart';
//
// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   CameraService cameraService = CameraService();
//   DatabaseHelper dbHelper = DatabaseHelper();
//   List<Map<String, dynamic>> faces = [];
//   XFile? image;
//   Timer? _timer;
//   bool isCameraReady = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     fetchFaces();
//     _startAutoCapture();
//   }
//
//   Future<void> _initializeCamera() async {
//     await cameraService.initCamera();
//     setState(() {
//       isCameraReady = true; // Update state when camera is ready
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     cameraService.dispose();
//     super.dispose();
//   }
//
//   Future<void> fetchFaces() async {
//     faces = await dbHelper.getFaces();
//     setState(() {});
//   }
//
//   Future<bool> isDuplicateFace(InputImage newFaceImage) async {
//     final faceDetector = GoogleMlKit.vision.faceDetector();
//     final List<Face> newDetectedFaces = await faceDetector.processImage(newFaceImage);
//
//     // If no faces are detected, return false
//     if (newDetectedFaces.isEmpty) return false;
//
//     for (var face in faces) {
//       final storedImage = InputImage.fromFilePath(face['imagePath']);
//       final List<Face> storedDetectedFaces = await faceDetector.processImage(storedImage);
//
//       if (storedDetectedFaces.isNotEmpty && newDetectedFaces.isNotEmpty) {
//         // Compare the face features here
//         // For now, we assume the images are duplicates if we detect any faces in both.
//         // More advanced comparisons can be added using facial landmarks, etc.
//         return true;
//       }
//     }
//     return false;
//   }
//
//   void captureImage() async {
//     XFile? newImage = await cameraService.takePicture();
//     if (newImage != null) {
//       final inputImage = InputImage.fromFilePath(newImage.path);
//
//       // Check for duplicate faces
//       bool exists = await isDuplicateFace(inputImage);
//       if (!exists) {
//         String personName = "Person Name"; // You may want to dynamically determine this
//         await dbHelper.insertFace(personName, newImage.path);
//         await fetchFaces();
//       } else {
//         // Optionally inform the user
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("This face has already been captured.")),
//         );
//       }
//     }
//   }
//
//   void _startAutoCapture() {
//     _timer = Timer.periodic(Duration(seconds: 5), (timer) {
//       captureImage();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Face Recognition App')),
//       body: Column(
//         children: [
//           Expanded(
//             child: isCameraReady
//                 ? CameraPreview(cameraService.controller!)
//                 : Center(child: CircularProgressIndicator()), // Show progress only if the camera isn't ready
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: faces.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.file(
//                     File(faces[index]['imagePath']),
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(faces[index]['name']),
//                   onTap: () {
//                     // Navigate to the image detail page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ImageDetailPage(imagePath: faces[index]['imagePath']),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'dart:async';
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart'; // Import Google ML Kit
// import 'package:practices/view/face_recagnice_app/Image_detailes.dart';
// import 'package:practices/view/face_recagnice_app/camera_service.dart';
// import 'package:practices/view/face_recagnice_app/data_base.dart';
// import 'package:intl/intl.dart'; // Import intl for date formatting
//
// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   CameraService cameraService = CameraService();
//   DatabaseHelper dbHelper = DatabaseHelper();
//   List<Map<String, dynamic>> faces = [];
//   Timer? _timer;
//   bool isCameraReady = false;
//
//   final TextEditingController _nameController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     fetchFaces();
//     _startAutoCapture();
//   }
//
//   Future<void> _initializeCamera() async {
//     await cameraService.initCamera();
//     setState(() {
//       isCameraReady = true;
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     cameraService.dispose();
//     _nameController.dispose();
//     super.dispose();
//   }
//
//   Future<void> fetchFaces() async {
//     faces = await dbHelper.getFaces();
//     setState(() {});
//   }
//
//   Future<String?> isDuplicateFace(InputImage newFaceImage) async {
//     final faceDetector = GoogleMlKit.vision.faceDetector();
//     final List<Face> newDetectedFaces = await faceDetector.processImage(newFaceImage);
//
//     if (newDetectedFaces.isEmpty) return null;
//
//     for (var face in faces) {
//       final storedImage = InputImage.fromFilePath(face['imagePath']);
//       final List<Face> storedDetectedFaces = await faceDetector.processImage(storedImage);
//
//       if (storedDetectedFaces.isNotEmpty) {
//         return face['name']; // Return the name of the captured face
//       }
//     }
//     return null; // No duplicate found
//   }
//
//   void captureImage() async {
//     XFile? newImage = await cameraService.takePicture();
//     if (newImage != null) {
//       final inputImage = InputImage.fromFilePath(newImage.path);
//       final List<Face> detectedFaces = await GoogleMlKit.vision.faceDetector().processImage(inputImage);
//
//       if (detectedFaces.isNotEmpty) {
//         String? existingName = await isDuplicateFace(inputImage);
//         if (existingName == null) {
//           String personName = _nameController.text.isNotEmpty ? _nameController.text : "Unknown";
//           await dbHelper.insertFace(personName, newImage.path);
//           await fetchFaces();
//           _nameController.clear();
//         } else {
//           // If a face is already captured, show the existing name in the SnackBar
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Face already captured: $existingName")),
//           );
//           await fetchFaces();
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("No face detected. Image not captured.")),
//         );
//       }
//     }
//   }
//
//   void _startAutoCapture() {
//     _timer = Timer.periodic(Duration(seconds: 5), (timer) {
//       captureImage();
//     });
//   }
//
//   String formatTimestamp(String timestamp) {
//     DateTime dateTime = DateTime.parse(timestamp);
//     return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Face Recognition App')),
//       body: Column(
//         children: [
//           Expanded(
//             child: isCameraReady
//                 ? CameraPreview(cameraService.controller!)
//                 : Center(child: CircularProgressIndicator()),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Enter Person Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: faces.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.file(
//                     File(faces[index]['imagePath']),
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(faces[index]['name']),
//                   subtitle: Text(formatTimestamp(faces[index]['timestamp'])), // Display formatted timestamp
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ImageDetailPage(imagePath: faces[index]['imagePath']),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }











import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:intl/intl.dart';
import 'package:practices/view/face_recagnice_app/Image_detailes.dart';
import 'package:practices/view/face_recagnice_app/camera_service.dart';
import 'package:practices/view/face_recagnice_app/data_base.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraService cameraService = CameraService();
  DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> faces = [];
  Timer? _timer;
  bool isCameraReady = false;
  String? existingFaceName;

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    fetchFaces();
    _startAutoCapture();
  }

  Future<void> _initializeCamera() async {
    await cameraService.initCamera();
    setState(() {
      isCameraReady = true;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    cameraService.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> fetchFaces() async {
    faces = await dbHelper.getFaces();
    setState(() {});
  }

  Future<Map<String, dynamic>?> isDuplicateFace(InputImage newFaceImage) async {
    final faceDetector = GoogleMlKit.vision.faceDetector();
    final List<Face> newDetectedFaces = await faceDetector.processImage(newFaceImage);

    if (newDetectedFaces.isEmpty) return null;

    for (var face in faces) {
      final storedImage = InputImage.fromFilePath(face['imagePath']);
      final List<Face> storedDetectedFaces = await faceDetector.processImage(storedImage);

      if (storedDetectedFaces.isNotEmpty && areFeaturesSimilar(newDetectedFaces, storedDetectedFaces)) {
        return face;
      }
    }
    return null;
  }

  bool areFeaturesSimilar(List<Face> newFaces, List<Face> storedFaces) {
    return true;
  }

  void captureImage() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a name before capturing.")),
      );
      return;
    }

    XFile? newImage = await cameraService.takePicture();
    if (newImage != null) {
      final inputImage = InputImage.fromFilePath(newImage.path);
      final List<Face> detectedFaces = await GoogleMlKit.vision.faceDetector().processImage(inputImage);

      if (detectedFaces.isNotEmpty) {
        Map<String, dynamic>? existingFace = await isDuplicateFace(inputImage);
        if (existingFace == null) {
          String personName = _nameController.text.isNotEmpty ? _nameController.text : "Unknown";
          String timestamp = DateTime.now().toIso8601String();
          await dbHelper.insertFace(personName, newImage.path, timestamp);
          await fetchFaces();
          _nameController.clear();
          existingFaceName = null;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Face captured and saved as $personName.")),
          );
        } else {
          existingFaceName = existingFace['name'];
          String timestamp = existingFace['timestamp'];
          _showDuplicateFaceBottomSheet(existingFace['name'], timestamp);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No face detected. Image not captured.")),
        );
      }
    }
  }

  void _startAutoCapture() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      captureImage();
    });
  }

  void _showDuplicateFaceBottomSheet(String name, String timestamp) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity, // Set your desired width here
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Duplicate Face Detected",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Name: $name"),
              Text("Captured At: ${formatTimestamp(timestamp)}"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              ),
            ],
          ),
        );
      },
    );
  }


  String formatTimestamp(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    return DateFormat('yyyy-MM-dd – hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Face Recognition App')),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: isCameraReady
                    ? CameraPreview(cameraService.controller!)
                    : Center(child: CircularProgressIndicator()),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Person Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: faces.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.file(
                        File(faces[index]['imagePath']),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(faces[index]['name']),
                      subtitle: Text(formatTimestamp(faces[index]['timestamp'])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageDetailPage(imagePath: faces[index]['imagePath']),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          // Overlay to show existing face name
          if (existingFaceName != null)
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black54,
                child: Text(
                  "Duplicate Face Detected: $existingFaceName",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}





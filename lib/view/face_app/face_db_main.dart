import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'db_helper.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Storage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageCaptureScreen(),
    );
  }
}

class ImageCaptureScreen extends StatefulWidget {
  @override
  _ImageCaptureScreenState createState() => _ImageCaptureScreenState();
}

class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
  final ImagePicker _picker = ImagePicker();
  final DbHelper _dbHelper = DbHelper();
  List<String> _imagePaths = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final images = await _dbHelper.getImages();
    setState(() {
      _imagePaths = images.map((image) => image['imagePath'] as String).toList();
    });
  }

  Future<void> _captureImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      await _dbHelper.insertImage(image.path);
      _loadImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture and Store Images'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _imagePaths.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Image.file(File(_imagePaths[index])),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _captureImage,
            child: Text('Capture Image'),
          ),
        ],
      ),
    );
  }
}

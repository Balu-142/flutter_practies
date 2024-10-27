import 'package:flutter/material.dart';
import 'dart:io';

class ImageDetailPage extends StatelessWidget {
  final String imagePath;

  const ImageDetailPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Detail')),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}

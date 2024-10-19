import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PostProductScreen extends StatefulWidget {
  const PostProductScreen({super.key});

  @override
  State<PostProductScreen> createState() => _PostProductScreenState();
}

class _PostProductScreenState extends State<PostProductScreen> {
  final Dio _dio = Dio();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  String? _message;

  Future<void> postProduct() async {
    final productData = {
      'title': _titleController.text,
      'price': double.tryParse(_priceController.text),
      'category': _categoryController.text,
      'image': _imageController.text,
    };

    try {
      final response = await _dio.post('https://fakestoreapi.com/products', data: productData);
      if (response.statusCode == 200) {
        setState(() {
          _message = 'Product added successfully!';
        });
      } else {
        setState(() {
          _message = 'Failed to add product: ${response.statusMessage}';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: postProduct,
              child: const Text('Add Product'),
            ),
            if (_message != null) ...[
              const SizedBox(height: 20),
              Text(_message!, style: TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}

// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
//
// import '../../models/products.dart';
//
// class Products extends StatefulWidget {
//   const Products({super.key});
//
//   @override
//   State<Products> createState() => _ProductsState();
// }
//
// class _ProductsState extends State<Products> {
//   late Future<List<Product>> allProducts;
//
//   @override
//   void initState() {
//     super.initState();
//     allProducts = fetchProducts(); // Change to fetchProducts
//   }
//
//   Future<List<Product>> fetchProducts() async {
//     final dio = Dio();
//     final response = await dio.get('https://fakestoreapi.com/products');
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = response.data;
//       return data.map((item) => Product.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product List'),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: allProducts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No data found'));
//           } else {
//             List<Product> allProductsList = snapshot.data!;
//             return ListView.builder(
//               itemCount: allProductsList.length,
//               itemBuilder: (context, index) {
//                 final product = allProductsList[index];
//                 return Card(
//                   margin: EdgeInsets.all(10),
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                 child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.network(product.image .toString(),height: 100,width: 100,),
//                 SizedBox(height: 8), // Add some space between image and text
//                 Text(
//                 'Category: ${product.category}',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text('Price: \$${product.price.toString()}'),
//                 Text('Title: ${product.title}'),
//                 ],
//                   ),
//                 ),);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:practices/view/profile/categories.dart';
import '../../models/products.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late Future<List<Product>> allProducts;
  List<Product> filteredProducts = [];
  List<Product> allProductsList = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    allProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final dio = Dio();
    final response = await dio.get('https://fakestoreapi.com/products');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<Product> products = data.map((item) => Product.fromJson(item)).toList();
      setState(() {
        allProductsList = products;
        filteredProducts = products; // Initially display all products
      });
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  void _filterProducts(String query) {
    final filtered = allProductsList.where((product) {
      return product.title!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      searchQuery = query;
      filteredProducts = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: _filterProducts,
              decoration: const InputDecoration(
                hintText: 'Search for products...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: allProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }  else {
            return ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          product.image.toString(),
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Category: ${product.category}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Price: \$${product.price.toString()}'),
                        Text('Title: ${product.title}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}


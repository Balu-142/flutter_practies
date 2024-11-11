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




import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:practices/view/profile/categories.dart';
import 'package:practices/view/profile/productDetails.dart';
import 'package:practices/view/profile/provider/cart_provider.dart';
import 'package:practices/view/profile/provider/cart_screen.dart';
import 'package:provider/provider.dart';
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
        filteredProducts = products;
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
        title: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: _filterProducts,
              decoration:  InputDecoration(
                hintText: 'Search for products...',
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Card(
        child: Column(
          children: [
            SizedBox(height: 10),
            MyCarousel(),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: allProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No products found.'));
                  } else {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0, // Space between columns
                        mainAxisSpacing: 10.0, // Space between rows
                        childAspectRatio: 0.8,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return Container(
                          width: MediaQuery.sizeOf(context).height* 0.5, // Set a custom width for the card
                          height: MediaQuery.sizeOf(context).height* 0.6, // Set a custom height for the card
                          child:InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetailPage(product: product)));
                            },
                            child: Container(
                              margin: EdgeInsets.all(16.0), // Adjust margin as needed
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12.0), // Set the desired border radius
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8, // Set desired width
                                height: 30, // Set desired height
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              product.image.toString(),
                                              height: MediaQuery.sizeOf(context).height * 0.1,
                                              width: MediaQuery.sizeOf(context).width * 0.3,
                                              fit: BoxFit.contain,
                                            ),
                                            SizedBox(height: 16), // Space between the image and text
                                            Text(
                                              '${product.category}',
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            Text('${product.title}', style: TextStyle()),
                                            Text('Price: \$${product.price.toString()}'),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Provider.of<CartProvider>(context, listen: false).addToCart(product);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('${product.title} added to cart!')),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            backgroundColor: Colors.blue,
                                            padding: EdgeInsets.all(12),
                                          ),
                                          child: Icon(
                                            Icons.add_shopping_cart,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -0, // Position the button outside the SizedBox
                                        left: 0,
                                        right: 0,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              // height: 30,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => ProductDetailPage(product: product),
                                                    ),
                                                  );
                                                },
                                                child: Text("View More..."),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ),


                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:practices/models/products.dart';
// import 'package:practices/view/profile/provider/cart_provider.dart';
// import 'package:practices/view/profile/provider/order_provider.dart';
// import 'package:provider/provider.dart';
//
// class ProductDetailPage extends StatefulWidget {
//   final Product product; // Assuming you have a Product model
//
//   const ProductDetailPage({Key? key, required this.product}) : super(key: key);
//
//   @override
//   _ProductDetailPageState createState() => _ProductDetailPageState();
// }
//
// class _ProductDetailPageState extends State<ProductDetailPage> {
//   int quantity = 1;
//
//
//   void incrementQuantity() {
//     setState(() {
//       quantity++; // Increase quantity
//     });
//   }
//
//   void decrementQuantity() {
//     setState(() {
//       if (quantity > 1) {
//         quantity--; // Decrease quantity but not below 1
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Prodacts page")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               widget.product.image ?? '', // Ensure image is not null
//               height: MediaQuery.of(context).size.height * 0.5,
//               fit: BoxFit.cover, // To maintain aspect ratio
//             ),
//             const SizedBox(height: 16),
//             Text(
//               widget.product.category ?? 'Unknown Category',
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             // Text(
//             //   // ${product.title},
//             //   style: const TextStyle(fontSize: 20),
//             // ),
//             Text(
//               'Price: \$${(widget.product.price! * quantity).toStringAsFixed(2)}', // Format price
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             // Quantity control
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: decrementQuantity,
//                   child: const Text("-"),
//                 ),
//                 const SizedBox(width: 16),
//                 Text(
//                   '$quantity',
//                   style: const TextStyle(fontSize: 20),
//                 ), // Display quantity
//                 const SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: incrementQuantity,
//                   child: const Text("+"),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Provider.of<CartProvider>(context, listen: false).addToCart(widget.product);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('${widget.product.title} added to cart!')),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: const CircleBorder(),
//                   backgroundColor: Colors.blue,
//                   padding: const EdgeInsets.all(12),
//                 ),
//                 child: const Icon(
//                   Icons.add_shopping_cart,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                 Provider.of<OrderProvider>(context, listen: false).addToOrder(widget.product);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Your order is Done")),
//                 );
//                 },
//                 child: const Text("Buy Now"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:practices/models/products.dart';
import 'package:practices/view/profile/provider/cart_provider.dart';
import 'package:practices/view/profile/provider/order_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.product.image ?? '',
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.category ?? 'Unknown Category',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Price: \$${(widget.product.price! * quantity).toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrementQuantity,
                  child: const Text("-"),
                ),
                const SizedBox(width: 16),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: incrementQuantity,
                  child: const Text("+"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addToCart(widget.product,);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${widget.product.title} added to cart!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(12),
                ),
                child: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Create a new order with the original price and quantity
                  Provider.of<OrderProvider>(context, listen: false).addToOrder(widget.product, quantity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Your order is Done")),
                  );
                },
                child: const Text("Buy Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

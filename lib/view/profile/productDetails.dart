import 'package:flutter/material.dart';
import 'package:practices/models/products.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product; // Assuming you have a Product model

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1; // Initial quantity

  void incrementQuantity() {
    setState(() {
      quantity++; // Increase quantity
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--; // Decrease quantity but not below 1
      }
    });
  }

  void addToCart() {
    // Your logic to add the product with the specified quantity to the cart
    print('${widget.product.title} (x$quantity) added to cart.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.product.title}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.product.image.toString(),height: MediaQuery.sizeOf(context).height*0.5,),
            SizedBox(height: 16),
            Text(
              '${widget.product.category}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.product.title}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Price: \$${(widget.product.price! * quantity).toString()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Add more details as needed

            // Quantity control
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrementQuantity,
                  child: Text("-"),
                ),
                SizedBox(width: 16),
                Text('$quantity', style: TextStyle(fontSize: 20)), // Display quantity
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: incrementQuantity,
                  child: Text("+"),
                ),
              ],
            ),

            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: addToCart,
                child: Text("ADD Cart"),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement buy now logic
                },
                child: Text("Buy New"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

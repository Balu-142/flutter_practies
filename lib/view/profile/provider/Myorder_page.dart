import 'package:flutter/material.dart';
import 'package:practices/view/profile/provider/order_provider.dart';
import 'package:provider/provider.dart';
// import 'cart_provider.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('My Orders',style: TextStyle(),)),
      ),
      body: cartProvider.orderItems.isEmpty
          ? Center(child: Text('Empty orders'))
          : ListView.builder(
        itemCount: cartProvider.orderItems.length,
        itemBuilder: (context, index) {
          final product = cartProvider.orderItems[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                product.image ?? '', // Ensure the image URL is not null
                width: 50, // Set a fixed width
                fit: BoxFit.cover, // Maintain aspect ratio
              ),
              title: Text(product.title!),
              subtitle: Text('Price: \$${product.price?.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.remove_shopping_cart),
                onPressed: () {
                  cartProvider.removeFromOrder(product);
                },
              ),
            ),
          );
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Text(
      //       'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
      //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class Cart_page extends StatefulWidget {
//   const Cart_page({super.key});
//
//   @override
//   State<Cart_page> createState() => _Cart_pageState();
// }
//
// class _Cart_pageState extends State<Cart_page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Cart"),
//       ),
//       body: ListView(
//         children: [
//
//         ],
//       ),
//     );
//   }
// }


// cart_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Cart')),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final product = cartProvider.cartItems[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                product.image ?? '',
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.title!),
              subtitle: Text('Price: \$${product.price?.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.remove_shopping_cart),
                onPressed: () {
                  cartProvider.removeFromCart(product);
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}


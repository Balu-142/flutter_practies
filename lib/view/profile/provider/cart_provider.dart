// import 'package:flutter/cupertino.dart';
//
// import '../../../models/products.dart';
//
// class CartProvider with ChangeNotifier{
//   final Map<String,Product> _items = {};
//   Map<String,Product> get items => _items;
//
//   int get itemCount {
//     return _items.length;
//   }
//
//   double get totalAmount{
//     double total =0.0;
//     _items.forEach((_,Product){
//       // total += (Product.price * Product.description);
//     });
//     return total;
//   }
//
//   void addItem(String productId, String title, double price,) {
//     if (_items.containsKey(productId)) {
//       _items.update(
//         productId,
//             (existingCartItem) => Product(
//           id: existingCartItem.id,
//           title: existingCartItem.title,
//               // description: existingCartItem.quantity + 1,
//           price: existingCartItem.price,
//         ),
//       );
//     } else {
//       _items[productId] = Product(
//         // id:ProductId,
//         title: title,
//         // quantity: 1,
//         price: price,
//       );
//     }
//     notifyListeners();
//   }
//
//   void removeItem(String productId) {
//     _items.remove(productId);
//     notifyListeners();
//   }
//
//   void clear() {
//     _items.clear();
//     notifyListeners();
//   }
//
// }



import 'package:flutter/material.dart';

import '../../../models/products.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (total, item) => total );
  }
}

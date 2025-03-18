import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_screen.dart';

// Model for a product
class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

// StateProvider for the shopping cart (list of products)
final cartProvider = StateProvider<List<Product>>((ref) => []);

class ShoppingCartApp extends ConsumerWidget {
  final List<Product> products = [
    Product('Laptop', 1200.0),
    Product('Mouse', 25.0),
    Product('Keyboard', 50.0),
    Product('Monitor', 300.0),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                ref.read(cartProvider.notifier).state = [...ref.read(cartProvider), product];
              },
            ),
          );
        },
      ),
    );
  }
}




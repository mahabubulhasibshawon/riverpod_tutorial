import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/products_provider.dart';

class ProductSearchScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(productSearchProvider);
    final searchNotifier = ref.read(productSearchProvider.notifier);

    final TextEditingController searchController = TextEditingController();
    String selectedCategory = 'All'; // Default category

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search Products',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                searchNotifier.searchProducts(value, selectedCategory);
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedCategory,
              items: ['All', 'Electronics', 'Clothing', 'Books']
                  .map((category) => DropdownMenuItem(
                value: category,
                child: Text(category),
              ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  selectedCategory = value;
                  searchNotifier.searchProducts(
                      searchController.text, selectedCategory);
                }
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(child: Text('No products found.'))
                  : ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final product = searchResults[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    trailing: Text(product.category),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
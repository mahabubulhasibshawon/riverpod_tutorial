import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/search_with_categoryfilter/data/product.dart';


final productSearchProvider = StateNotifierProvider<ProductSearchNotifier, List<Product>>((ref) => ProductSearchNotifier([]));

class ProductSearchNotifier extends StateNotifier<List<Product>> {
  ProductSearchNotifier(super.state);

  void searchProducts(String query, String categoryFilter) {
    List<Product> filteredProducts = allProducts;

    if (categoryFilter != 'All' && categoryFilter.isNotEmpty)
      filteredProducts = filteredProducts.where((product) => product.category.toLowerCase() == categoryFilter.toLowerCase()).toList();
    if (query.isNotEmpty)
      filteredProducts = filteredProducts.where((product)=> product.name.toLowerCase().contains(query.toLowerCase())).toList();
    state = filteredProducts;
  }
}
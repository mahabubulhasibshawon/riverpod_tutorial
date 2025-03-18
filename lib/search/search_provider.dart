import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/search/item.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, List<Item>>((ref){
  return SearchNotifier(_allItems);
});

final List<Item> _allItems = allItemsData.map((data) => Item(data)).toList();

class SearchNotifier extends StateNotifier<List<Item>> {
  SearchNotifier(super.state);

  void search(String query) {
    if (query.isEmpty)
      state = _allItems;
    else
      state = _allItems.where((item) =>
      item.name.toLowerCase().contains(
          query.toLowerCase()) ||
          item.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
  }
}
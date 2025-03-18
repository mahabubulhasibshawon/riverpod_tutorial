import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/search/search_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final search = ref.watch(searchProvider);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 20,
              children: [
                TextField(
                  onChanged: (value) {
                    ref.read(searchProvider.notifier).search(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'search'),
                ),
                Expanded(
                    child: ref.watch(searchProvider).isEmpty
                        ? const Center(child: Text('No results found'))
                        : ListView.builder(
                            itemCount: ref.watch(searchProvider).length,
                            itemBuilder: (context, index) {
                              final item = ref.watch(searchProvider)[index];
                              return Card(
                                child: ListTile(
                                  title: Text(item.name),
                                  subtitle: Text(item.description),
                                ),
                              );
                            })),
              ],
            ),
          );
        },
      ),
    );
  }
}

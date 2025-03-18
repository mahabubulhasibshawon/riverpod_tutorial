import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/counter_screen.dart';
import 'package:riverpod_tutorial/home_screen.dart';
import 'package:riverpod_tutorial/search/search_screen.dart';
import 'package:riverpod_tutorial/search_with_categoryfilter/screens/product_search_screen.dart';
import 'package:riverpod_tutorial/shopping_cart/shopping_cart.dart';
import 'package:riverpod_tutorial/state_notifier_provider/user_provider.dart';
import 'package:riverpod_tutorial/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: ProductSearchScreen(),
      ),
    );
  }
}

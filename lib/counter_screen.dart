import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

final themeProviderLight = StateProvider((ref) {
  return ThemeData.light();
});


class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final count = ref.watch(counter);
            return Center(child: Text(count.toString(), style: TextStyle(fontSize: 50),),);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                ref.read(counter.notifier).state ++;
              }, child: Text('+', style: TextStyle(fontSize: 50),)),
              ElevatedButton(onPressed: () {
                ref.read(counter.notifier).state --;
              }, child: Text('-', style: TextStyle(fontSize: 50),))
            ],
          ),
          Switch(value: ref.watch(themeProviderLight) == ThemeData.dark(), onChanged: (value) {
            ref.read(themeProviderLight.notifier).state = ref.read(themeProviderLight) == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
          })
        ],
      ),
    );
  }
}

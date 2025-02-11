import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider((ref) {
  return 0;
});

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
    );
  }
}

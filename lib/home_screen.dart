import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref){
  return 'welcome';
});

final counter = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter app'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child) {
            final count = ref.watch(counter);
            return Center(
              child: Text(count.toString(), style: TextStyle(fontSize: 50),),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state ++;
              }, child: Text('+', style: TextStyle(fontSize: 30),)),
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state --;
              }, child: Text('-', style: TextStyle(fontSize: 30)))
            ],
          )
        ],
      ),
    );
  }
}

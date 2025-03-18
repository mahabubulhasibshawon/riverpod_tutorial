import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoListProvider = StateProvider<List<String>>((ref)=> []);

class TodoListScreen extends ConsumerWidget {
  TodoListScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(controller: _textEditingController,)),
              IconButton(onPressed: () {
                final task = _textEditingController.text;
                if(task.isNotEmpty) {
                  ref.read(todoListProvider.notifier).state = [
                    ...todoList,
                    task
                  ];
                  _textEditingController.clear();
                }
              }, icon: Icon(Icons.add))
            ],
          ),
          Expanded(child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(todoList[index]),
                trailing: IconButton(onPressed: () {
                  ref.read(todoListProvider.notifier).state = [
                    ...todoList.sublist(0, index),
                    ...todoList.sublist(index+1)
                  ];
                }, icon: Icon(Icons.delete)),
              )))
        ],
      ),
    );
  }
}

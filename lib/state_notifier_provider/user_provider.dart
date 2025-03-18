import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/state_notifier_provider/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier(const User(name: '', age: 0)));

class UserProviderScreen extends StatelessWidget {
  const UserProviderScreen({super.key});

  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateaAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer(
          builder: (context, ref, child) {
            final user = ref.watch(userProvider);
            return Column(
              children: [
                Text('name ' +user.name + ' and age '+ user.age.toString()),
                TextField(
                  onSubmitted: (value) => onSubmit(ref, value),
                ),
                TextField(
                  onSubmitted: (value) => onSubmitAge(ref, value),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

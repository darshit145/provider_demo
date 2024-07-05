import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_demo/river_pod/river_pod_modal.dart';
class UpgeradeOverTheState extends ConsumerWidget {
  const UpgeradeOverTheState({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final used=ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(used.name),
    ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              ref.read(userProvider.notifier).updateName(value);

            },
          ),
          TextField(
            keyboardType: TextInputType.number,
              onChanged: (value) {
                ref.read(userProvider.notifier).updateAge(int.parse(value));

              }
          ),
          Text(used.age.toString()),
          abd(),
        ],
      ),

    );

  }
  abd(){
    print("cacac");
    return Text("hello");
  }

}

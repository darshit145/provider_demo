import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_demo/river_pod/river_pod_modal.dart';

class FutureProviderWithRiver extends ConsumerWidget {
  const FutureProviderWithRiver({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(futureProvider).when(
          data: (data) {
            return Scaffold(
              appBar: AppBar(
                title: Text(data.name),
              ),
              body: Column(
                children: [
                  Text(data.name),
                  Text(data.age.toString())
                ],
              ),
            );
          },
          error: (error, stackTrace) => Text("Error"),
          loading: () => Text("loadintg"),
        );
  }
}

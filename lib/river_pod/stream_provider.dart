import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_demo/river_pod/river_pod_modal.dart';

class StreamProvider extends ConsumerWidget {
  const StreamProvider({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(streamProvidev).when(
          data: (data) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                children: [
                  Text(data.length.toString()),
                  Text(data[1].toString()),
                  Text(data[4].toString()),
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => Scaffold(),
          loading: () => Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
  }
}

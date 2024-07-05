import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_demo/river_pod/river_pod_modal.dart';
import 'package:provider_demo/river_pod/riverpod_with_update_val.dart';

class RiverPodDemoScreen extends ConsumerWidget {
  const RiverPodDemoScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name=ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RiverPodDemo2(),));
        },
      ),
    );
  }
}
class RiverPodDemo2 extends StatelessWidget {
  const RiverPodDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RiverpodWithUpdateVal(),));
        },
      ),
      appBar: AppBar(
        title: Consumer(builder: (context,ref,dd) {

          return Text(ref.watch(nameProvider));
        },),
      ),
    );
  }
}

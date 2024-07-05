import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_demo/river_pod/river_pod_modal.dart';
class RiverpodWithUpdateVal extends ConsumerWidget {
  const RiverpodWithUpdateVal({super.key});
  stringUpdate(ss,ref){
    ref.read(nameProviderWithUpdate.notifier).update((v)=>ss.toString());
    print("okko");
  }

  @override
  Widget build(BuildContext context,ref) {
    print("calll");
    var namr=ref.watch(nameProviderWithUpdate)??"";
    return Scaffold(
      appBar: AppBar(
        title: Text(namr.toString()),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              stringUpdate(value, ref);
            },
          )

        ],
      ),
    );
  }
}

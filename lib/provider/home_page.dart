import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/cart_provider.dart';
import 'package:provider_demo/provider/product.dart';
import 'package:provider_demo/river_pod/river_pod_demo_screen.dart';
import 'package:provider_demo/river_pod/stream_provider.dart' as st;
import '../river_pod/future_provider_with_river.dart';
import '../river_pod/upgerade_over_the_state.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingScreen(),));

          }, child: Text("Provider")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RiverPodDemoScreen(),));

          }, child: Text("RiverPod Demo Screen")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UpgeradeOverTheState(),));

          }, child: Text("UpgreadeOver the State")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FutureProviderWithRiver(),));

          }, child: Text("Future Provider")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => st.StreamProvider(),));

          }, child: Text("Stream Provider")),

        ],
      ),
    );
  }
}





class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("caccc");
    CartProvider cartProvider=Provider.of<CartProvider>(context,listen: false);

    // CartProvider cartProvider=Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingHistory(),));

          }, icon: Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, vaeelue, child) {
          return ListView.builder(
            itemCount: PRODUCTS.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(PRODUCTS[index].name),
                  subtitle: Text(PRODUCTS[index].price.toString()),
                  trailing: Checkbox(
                    onChanged: (value) {
                      if(value==true){

                        // cartProvider.addItem(PRODUCTS[index]);
                        vaeelue.addItem(PRODUCTS[index]);
                      }else{
                        vaeelue.removeItem(PRODUCTS[index]);

                        // cartProvider.removeItem(PRODUCTS[index]);
                      }

                    },value: vaeelue.item.contains(PRODUCTS[index])
                  // cartProvider.item.contains(PRODUCTS[index])?true:false,
                  ),
                  tileColor: PRODUCTS[index].color,
                  leading: Text(PRODUCTS[index].id.toString()),
                ),
              );

            },);
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          cartProvider.removeAll();

        },child: Icon(Icons.add),
      ),
    );
  }
}
class ShoppingHistory extends StatelessWidget {
  const ShoppingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    print("Buidl");
    return Scaffold(



      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          return  ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(value.item[index].name),
              subtitle: Text("${value.item[index].price.toString()}  :  ${ value.getCartTotal().toString()}"),
              trailing: Checkbox(
                  onChanged: (val) {
                    if(val==true){

                      // cartProvider.addItem(PRODUCTS[index]);
                      value.addItem(value.item[index]);
                    }else{
                      value.removeItem(value.item[index]);

                      // cartProvider.removeItem(PRODUCTS[index]);
                    }

                  },value: value.item.contains(value.item[index])
                // cartProvider.item.contains(PRODUCTS[index])?true:false,
              ),
              tileColor: value.item[index].color,
              leading: Text(value.item[index].id.toString()),
            );
          },itemCount: value.item.length,
          );
        },

      ),
    );
  }
}

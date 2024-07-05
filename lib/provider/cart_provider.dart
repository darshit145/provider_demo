import 'package:flutter/material.dart';
import 'package:provider_demo/provider/product.dart';
class CartProvider extends ChangeNotifier{
 final List<Product> _item=[];


 List<Product> get item=>_item;


 void addItem(Product item){
   _item.add(item);
   notifyListeners();
 }
 void removeItem(Product item){
   _item.remove(item);
   notifyListeners();
 }
 void removeAll(){
   _item.clear();
   notifyListeners();
 }
 
 double getCartTotal(){
   return _item.fold(0, (previousValue, element) => previousValue+element.price,);
 }

}
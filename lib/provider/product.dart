import 'package:flutter/animation.dart';

class Product{
  final int id;
  final String name;
  final int price;
  final Color color;
  Product({required this.color,required  this.name,required this.id,required this.price});
}
final List<Product> PRODUCTS=[
  Product(color: Color(0xFFFF9000), name: "Mobile", id: 1, price: 10000),
  Product(color: Color(0xFFFF9000), name: "T.V", id: 2, price: 10000),
  Product(color: Color(0xFFFF9000), name: "A.C", id: 3, price: 10000),
  Product(color: Color(0xFFFF9000), name: "Call", id: 4, price: 10000),
  Product(color: Color(0xFFFF9000), name: "Helicoptor", id: 5, price: 10000),
];
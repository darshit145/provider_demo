import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
//provider Read only
final nameProvider=Provider<String>((vel){
  return "Hello to RiverPod\nProvider";
});

//provider with UpdatedValue
final nameProviderWithUpdate=StateProvider<String?>((vel){
  return null;
});

final userProvider=StateNotifierProvider<UserNotifier,User>((ref)=>UserNotifier(User(name: "", age: 0)));

//state Notifier And Staate notifier Provider

class User{
  final int age;
  final String name;
  User({required this.name,required this.age});

  User copiWith({String?name,int?age}){
    return User(name: name??this.name, age: age??this.age);
  }
  factory User.fromJson(val){
    // var d=jsonDecode(val);
    return User(name:val[0]["title"] , age:val[0]["userId"] );


  }
}
class  UserNotifier extends StateNotifier<User>{
  UserNotifier(super.state);

  void updateName(String n){
    state=state.copiWith(name: n);

  }
  void updateAge(int n){
    state=state.copiWith(age: n);

  }
}

//Future Provider
final futureProvider=FutureProvider((val){
  const link="https://jsonplaceholder.typicode.com/posts";

  return http.get(Uri.parse(link)).then(( valr){
    print("llllllllllllllllllllllllllllll");
    print(valr);
    print(jsonDecode(valr.body));
    var r=jsonDecode(valr.body);

    return User.fromJson(r);
  });

});


//StreamProvider
final streamProvidev=StreamProvider((ref)async*{
  yield [1,2,3,4,5,6,7];

});
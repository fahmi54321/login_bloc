import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget{

  //todo 1
  Provider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  //todo 2
  final bloc = Bloc();


  //todo 3
  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }

  //todo 4 (next main.dart)
  static Bloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).bloc;
  }

}
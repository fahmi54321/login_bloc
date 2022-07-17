import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget{

  Provider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final bloc = Bloc();


  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).bloc;
  }

}
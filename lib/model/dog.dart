import 'package:flutter/material.dart';

class Dog  extends ChangeNotifier{
  final String name;
  final String bread;
  int age;

  Dog({required this.name, required this.bread,  this.age = 1});

  void increaseAge(){
    age += 1;
    notifyListeners();
  }

}  
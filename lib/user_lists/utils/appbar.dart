import 'package:flutter/material.dart';

class MyAppBar{
  static PreferredSizeWidget? myAppBar(String title){
  return AppBar(
    title: Center(child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    backgroundColor: Colors.blueAccent,
  );
}
}
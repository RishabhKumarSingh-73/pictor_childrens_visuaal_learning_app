import 'package:children_learn_assist/user_lists/views/home_page.dart';
import 'package:children_learn_assist/user_lists/view_modal/pictor_providors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PictorProvidor())],
      child: MaterialApp(
        title: 'pictor',
      
        home: HomePage(),
      ),
    );
  }
}
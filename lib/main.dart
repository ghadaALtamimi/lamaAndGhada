import 'package:flutter/material.dart';
import 'package:recipe_view/ingrediants.dart';
import 'package:recipe_view/recipe_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<String> a = ["jjj", "kjk"];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: recipe_view(),
    );
  }
}

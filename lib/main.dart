import 'package:flutter/material.dart';
import 'package:arti_art/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtiArt',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

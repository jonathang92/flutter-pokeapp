import 'package:flutter/material.dart';
import 'package:pokeapp/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(fontFamily: 'Abel'),
      home: HomePage(),
    );
  }
}

// Pokedollar = 200 ₽

import 'package:animals_show_animation/pages/characters_list_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animals',
      theme:
      ThemeData(primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      canvasColor: Colors.white,
      ),
      home:CharacterListScreen(),
    );
  }
}

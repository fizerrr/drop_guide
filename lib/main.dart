import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Drop Guide',

      theme: ThemeData(
        fontFamily: 'Inconsolata',
        scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 1),
        hoverColor: Colors.black
      ),

      home: HomeScreen(),
    );
  }
}


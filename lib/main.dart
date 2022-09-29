import 'package:drop_guide/providers/size_provider.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SetSize(),)
      ],
      child: MyApp(),
    )
  );
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
      ),

      home: HomeScreen(),
    );
  }
}


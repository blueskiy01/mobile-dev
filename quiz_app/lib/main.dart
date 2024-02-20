import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp( const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Quiz App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.green, // Set appbar color to lime green
        ),
      ),
      home: CategoriesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
import 'package:flutter/material.dart';
import 'views/main_page.dart'; //

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Movie List',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF2E1D3D),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF616161),
        ),
        fontFamily: 'arial',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 55.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 10.0, fontFamily: 'Hind'),
        ),
      ),
      home:const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }

}
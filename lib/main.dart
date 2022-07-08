import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme:
          ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.deepPurple
          ),
    );
  }
}
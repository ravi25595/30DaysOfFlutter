import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "codepur";
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Container(
            child: Text("Welcome to $days days of flutter by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
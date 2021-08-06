import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Grocery Hub'),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
// not using rn
//import 'package:page_transition/page_transition.dart';

import 'package:grocery_hub_capstone/navigation/menu_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Hub',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
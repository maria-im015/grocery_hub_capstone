import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';

// content that loads on the inventory page

class Inventory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Current Inventory'),
      ),
      body: Container(
        child: Center(
          child: Text('Current Inventory'),
        ),
      ),
    );
  }
}
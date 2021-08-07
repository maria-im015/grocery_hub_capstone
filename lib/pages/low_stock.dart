import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';

// content that loads on the low stock page

class LowStock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Low Stock'),
      ),
      body: Container(
        child: Center(
          child: Text('Low Stock'),
        ),
      ),
    );
  }
}
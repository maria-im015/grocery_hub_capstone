import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';

// content that loads on the grocery list page

class GroceryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: Container(
        child: Center(
          child: Text('Grocery List'),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';
import 'package:grocery_hub_capstone/pages/grocery_list_detailed.dart';
import 'package:grocery_hub_capstone/pages/low_stock_detailed.dart';

// content that loads on the grocery list page

class GroceryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Grocery Hub - Grocery List'),
      ),
      body: GroceryListData(),
      );
  }
} 
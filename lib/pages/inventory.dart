import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';
import 'package:grocery_hub_capstone/pages/inventory_detailed.dart';

// content that loads on the inventory page

class Inventory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Grocery Hub - Current Inventory'),
      ),
      body: GetApi(),
      );
  }
}
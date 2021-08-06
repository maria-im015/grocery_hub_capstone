import 'package:flutter/material.dart';

class GroceryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
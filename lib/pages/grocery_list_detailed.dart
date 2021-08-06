import 'package:flutter/material.dart';

class GroceryListDetailed extends StatelessWidget {
  final String name;
  final String email;

  GroceryListDetailed({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: Container(
          child: ListTile(
        title: Text(name),
        subtitle: Text(email),
      )),
    );
  }
}
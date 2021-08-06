import 'package:flutter/material.dart';

class InventoryDetailed extends StatelessWidget {
  final String name;
  final String email;

  InventoryDetailed({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Inventory'),
      ),
      body: Container(
          child: ListTile(
        title: Text(name),
        subtitle: Text(email),
      )),
    );
  }
}
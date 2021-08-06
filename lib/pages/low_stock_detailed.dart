import 'package:flutter/material.dart';

class LowStockDetailed extends StatelessWidget {
  final String name;
  final String email;

  LowStockDetailed({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Low Stock'),
      ),
      body: Container(
          child: ListTile(
        title: Text(name),
        subtitle: Text(email),
      )),
    );
  }
}
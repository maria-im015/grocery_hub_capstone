import 'package:flutter/material.dart';

class LowStock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
import 'package:flutter/material.dart';

class Inventory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
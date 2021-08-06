import 'package:flutter/material.dart';

class ConsumeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consume Item'),
      ),
      body: Container(
        child: Center(
          child: Text('Consume Item'),
        ),
      ),
    );
  }
}
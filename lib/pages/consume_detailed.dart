import 'package:flutter/material.dart';

class ConsumeDetailed extends StatelessWidget {
  final String name;
  final String email;

  ConsumeDetailed({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consume Item'),
      ),
      body: Container(
          child: ListTile(
        title: Text(name),
        subtitle: Text(email),
      )),
    );
  }
}
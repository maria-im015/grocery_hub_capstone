import 'package:flutter/material.dart';

class ScanItemDetailed extends StatelessWidget {
  final String name;
  final String email;

  ScanItemDetailed({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Item'),
      ),
      body: Container(
          child: ListTile(
        title: Text(name),
        subtitle: Text(email),
      )),
    );
  }
}
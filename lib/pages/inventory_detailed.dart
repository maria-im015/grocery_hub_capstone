import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

/// GET example ///

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  _GetApiState createState() {
    return _GetApiState();
  }
}

class _GetApiState extends State<GetApi> {
  final url = "http://localhost:9283/api/products";

  var _postsJson = [];

  void fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {
      print('did not work');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    fetchPosts();
    return MaterialApp(
      home: Scaffold(
          body: ListView.builder(
              itemCount: _postsJson.length,
              itemBuilder: (context, i) {
                final post = _postsJson[i];
                return Text(
                    'Product name: ${post['name']}\n quantity in stock: ${post['qu_id_stock']}\n\n');
              })),
    );
  }
}

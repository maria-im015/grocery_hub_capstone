// import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/pages/home.dart';
import 'package:grocery_hub_capstone/pages/home_detailed.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Product> createProduct(String name) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Product.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Product.');
  }
}

class Product {
  final int id;
  final String name;

  Product({required this.id, required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
    );
  }
}









// class ExpirationDateArgs {
//   late final String date;

//   ExpirationDateArgs({required this.date});
// }
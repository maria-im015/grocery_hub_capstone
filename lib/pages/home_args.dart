// import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/pages/home.dart';
import 'package:grocery_hub_capstone/pages/home_detailed.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<AddProduct> createProduct(String name) async {
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
    return AddProduct.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Product.');
  }
}

class AddProduct {
  // final int id;
  String productName;
  // String productQuantity;

  AddProduct(
      {
      // required this.id,
      required this.productName,
      // required this.productQuantity
      });

  factory AddProduct.fromJson(Map<String, dynamic> json) {
    return AddProduct(
      // id: json['id'],
      productName: json['name'], 
      // productQuantity: '',
    );
  }
}

// class Result extends StatelessWidget {
//   Product product;

//   Result({required this.product});
// }

// class ExpirationDateArgs {
//   late final String date;

//   ExpirationDateArgs({required this.date});
// }

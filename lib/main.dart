import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// not using rn
//import 'package:page_transition/page_transition.dart';

// import 'package:grocery_hub_capstone/navigation/menu_bar.dart';

//import 'package:grocery_hub_capstone/pages/consume_arguments.dart';
import 'package:grocery_hub_capstone/pages/home.dart';
import 'package:grocery_hub_capstone/pages/consume.dart';
import 'package:grocery_hub_capstone/pages/grocery_list.dart';
import 'package:grocery_hub_capstone/pages/inventory.dart';
import 'package:grocery_hub_capstone/pages/low_stock.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  static const String _title = 'Grocery Hub';

  // var email;
  // var name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        title: _title,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/consume-product') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    ConsumeProduct());
          } else if (settings.name == '/current-inventory') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    Inventory());
          } else if (settings.name == '/low-stock') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    LowStock());
          } else if (settings.name == '/grocery-list') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    GroceryList());
          }
          return null;
        });
  }
}


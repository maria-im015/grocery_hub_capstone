import 'package:flutter/material.dart';
// not using rn
//import 'package:page_transition/page_transition.dart';

import 'package:grocery_hub_capstone/navigation/menu_bar.dart';
//import 'package:grocery_hub_capstone/pages/consume_item.dart';
//import 'package:grocery_hub_capstone/pages/consume_arguments.dart';
import 'package:grocery_hub_capstone/pages/consume_detailed.dart';
import 'package:grocery_hub_capstone/pages/grocery_list_detailed.dart';
import 'package:grocery_hub_capstone/pages/inventory_detailed.dart';
import 'package:grocery_hub_capstone/pages/low_stock_detailed.dart';
import 'package:grocery_hub_capstone/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  static const String _title = 'Grocery Hub';

  var email;
  var name;

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
          if (settings.name == '/consume-item') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    ConsumeDetailed(name: name, email: email));
          } else if (settings.name == '/current-inventory') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    InventoryDetailed(name: name, email: email));
          } else if (settings.name == '/low-stock') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    LowStockDetailed(name: name, email: email));
          } else if (settings.name == '/grocery-list') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    GroceryListDetailed(name: name, email: email));
          }
          return null;
        });
  }
}


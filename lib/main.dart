import 'package:flutter/material.dart';
// not using rn
//import 'package:page_transition/page_transition.dart';

import 'package:grocery_hub_capstone/navigation/menu_bar.dart';
//import 'package:grocery_hub_capstone/pages/consume_item.dart';
//import 'package:grocery_hub_capstone/pages/consume_arguments.dart';
import 'package:grocery_hub_capstone/pages/consume_detailed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var email;

  var name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Grocery Hub',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          // '/profile': (context) => ConsumeItem()
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/detailed-profile') {
            Object? args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) =>
                    ConsumeDetailed(name: name, email: email));
          }
          return null;
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Grocery Hub'),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';
import 'package:grocery_hub_capstone/pages/home_detailed.dart';
// import 'package:grocery_hub_capstone/pages/page_models.dart';

// Content that loads on the home page.
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String _title = 'Grocery Hub - Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(title: const Text(_title)),
      body: HomeDetailed(),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      body: TestApi(),
    );
  }
}

class TestApi extends StatefulWidget {
  const TestApi({Key? key}) : super(key: key);

  @override
  _TestApiState createState() {
    return _TestApiState();
  }
}

class _TestApiState extends State<TestApi> {
  final url = "http://localhost:9283/api/objects/products";

// // quantity unit purchase/stock are both package type
// // factor purchase is quantity, default is 1
// // required fields for grocy: {"qu_id_purchase": "2", "qu_id_stock":"2", "location_id": "2", "name": "test2", "qu_factor_purchase_to_stock": 1.0}
  var GROCY_API_KEY = dotenv.env['API_KEY'];

  void postData() async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "accept": "application/json",
            "GROCY-API-KEY": GROCY_API_KEY!,
          },
          body: jsonEncode(<String, String>{
            "qu_id_purchase": "2", //6 options: 1:nothing, 2:piece,  3:pack
            // 4:case, 5:bottle, 6:can, 7:bag
            "qu_id_stock": "9",
            "location_id": "9", // 9 options: 1:nothing, 2:fridge,  3:freezer, 
            // 4:DF, 5: stove cabinet, 6:spice rack, 7:lazy susan, 8:pantry, 9:ki
            "name": "test18",
            "qu_factor_purchase_to_stock": "4.0",
          }));
      print(response.body);
    } catch (err) {
      print('did not work');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ElevatedButton(
          onPressed: (postData),
          child: Text('Send Post'),
        )),
      ),
    );
  }
}

////// <<<<<<<<<
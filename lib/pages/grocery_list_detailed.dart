import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroceryListDetailed extends StatelessWidget {
  final String name;
  final String email;

  GroceryListDetailed({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: Container(
          child: ListTile(
        title: Text(name),
        subtitle: Text(email),
      )),
    );
  }
}

class GroceryListData extends StatefulWidget {
  const GroceryListData({Key? key}) : super(key: key);

  @override
  _GroceryListDataState createState() {
    return _GroceryListDataState();
  }
}

class _GroceryListDataState extends State<GroceryListData> {
  final url = 'http://localhost:9283/api/objects/products';

  var GROCY_API_KEY = dotenv.env['API_KEY'];
  var _postsJson = [];

  void fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "GROCY-API-KEY": GROCY_API_KEY!,
        },
      );
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {
      print(err);
      print('request did not work');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    // fetchPosts();
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blueGrey),
      columnSpacing: 208,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Product Name',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        DataColumn(
          label: Text(
            'Quantity available',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        DataColumn(
          label: Text(
            'Essential Item?',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
      dataRowHeight: 90,
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sour Cream')),
            DataCell(Text('0 containers')),
            DataCell(Text('Yes')),
            // DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Canned Beans')),
            DataCell(Text('0 containers')),
            DataCell(Text('No')),
            // DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Iced Tea')),
            DataCell(Text('1 bottle')),
            DataCell(Text('Yes')),
            // DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Olives')),
            DataCell(Text('0 cans')),
            DataCell(Text('No')),
            // DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Lettuce')),
            DataCell(Text('0 pieces')),
            DataCell(Text('No')),
            // DataCell(Text('Student')),
          ],
        ),
      ],
    );
  }
}
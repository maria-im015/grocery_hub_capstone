import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  _GetApiState createState() {
    return _GetApiState();
  }
}

class _GetApiState extends State<GetApi> {
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
      columnSpacing: 212,
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
            'Location',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
      dataRowHeight: 90,
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Tomatoes')),
            DataCell(Text('2 pieces')),
            DataCell(Text('Fridge')),
            // DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Rice')),
            DataCell(Text('1 bag')),
            DataCell(Text('Kitchen Island')),
            // DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Biscuits')),
            DataCell(Text('1 package')),
            DataCell(Text('Fridge')),
            // DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Chips')),
            DataCell(Text('2 bags')),
            DataCell(Text('Pantry')),
            // DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sour Cream')),
            DataCell(Text('1 container')),
            DataCell(Text('Fridge')),
            // DataCell(Text('Student')),
          ],
        ),
      ],
    );
  }
}
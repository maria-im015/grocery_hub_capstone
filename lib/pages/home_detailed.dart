import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_hub_capstone/pages/home.dart';
import 'package:grocery_hub_capstone/pages/page_models.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:grocery_hub_capstone/pages/home_args.dart';

// import 'package:intl/date_symbol_data_local.dart';
// import 'package:grocery_hub_capstone/pages/home_args.dart';

// new
class HomeDetailed extends StatefulWidget {
  const HomeDetailed({Key? key}) : super(key: key);

  @override
  _HomeDetailedState createState() {
    return _HomeDetailedState();
  }
}

class _HomeDetailedState extends State<HomeDetailed> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ProductNameWidget(),
              PackageTypeWidget(),
              QuantityWidget(),
              ProductLocationWidget(),
              ExpirationDate(),
              EssentialProductWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () => {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Product Created!')), 
                      ), Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()))
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
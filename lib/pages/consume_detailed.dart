import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:grocery_hub_capstone/pages/page_models.dart';

class ConsumeDetailed extends StatefulWidget {
  const ConsumeDetailed({Key? key}) : super(key: key);

  @override
  _ConsumeDetailedState createState() {
    return _ConsumeDetailedState();
  }
}

class _ConsumeDetailedState extends State<ConsumeDetailed> {
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
              EssentialProductWidget(),
              AddGroceryListWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item Removed!')),
                      );
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





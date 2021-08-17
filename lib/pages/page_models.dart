import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

////// NEED TO ADD NULL SAFETY TO ALL /////

// Form for name of product.
class ProductNameWidget extends StatefulWidget {
  const ProductNameWidget({Key? key}) : super(key: key);

  @override
  State<ProductNameWidget> createState() => _ProductNameWidgetState();
}

class _ProductNameWidgetState extends State<ProductNameWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'What is the Product\'s name?',
        hintText: 'Enter Name',
        icon: const Icon(Icons.store),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          print('Please enter the name');
          // return 'Please enter the name';
        }
        final productName = value;
        print(productName);
        return productName;
      },
    );
  }
}

// Dropdown menu for type of package
class PackageTypeWidget extends StatefulWidget {
  const PackageTypeWidget({Key? key}) : super(key: key);

  @override
  State<PackageTypeWidget> createState() => _PackageTypeWidgetState();
}

class _PackageTypeWidgetState extends State<PackageTypeWidget> {
  String dropdownValue = 'Pack';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 300.0,
          height: 60.0,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Type of Package?',
              icon: const Icon(Icons.takeout_dining),
            ),
          ),
        ),
        SizedBox(
          width: 400.0,
          height: 60.0,
          child: DropdownButton<String>(
            value: dropdownValue,
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.blueGrey),
            underline: Container(
              height: 2,
              color: Colors.blueAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                final packageType = dropdownValue;
                print(packageType);
              });
            },
            items: <String>['Case', 'Pack', 'Piece', 'Bottle', 'Can', 'Bag']
                .map<DropdownMenuItem<String>>((String value) {
              // print(value);
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// Handles quantities for consume and add.
class QuantityWidget extends StatefulWidget {
  const QuantityWidget({Key? key}) : super(key: key);

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  final number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      autocorrect: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 3,
      decoration: InputDecoration(
          labelText: 'What is the quantity?',
          hintText: 'Enter Quantity',
          icon: const Icon(Icons.exposure_rounded)),
      validator: (value) {
        if (value!.isEmpty) {
          // return 'Please enter the quantity';
          print('Please enter the quantity');
        }
        final productQuantity = value;
        print(productQuantity);
        return productQuantity;
      },
    );
  }
}

// Dropdown menu for product's location.
class ProductLocationWidget extends StatefulWidget {
  const ProductLocationWidget({Key? key}) : super(key: key);

  @override
  State<ProductLocationWidget> createState() => _ProductLocationWidgetState();
}

class _ProductLocationWidgetState extends State<ProductLocationWidget> {
  String dropdownValue = 'Fridge';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 300.0,
          height: 60.0,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Product\'s Location?',
              icon: const Icon(Icons.place),
            ),
          ),
        ),
        SizedBox(
          width: 400.0,
          height: 60.0,
          child: DropdownButton<String>(
            value: dropdownValue,
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.blueGrey),
            underline: Container(
              height: 2,
              color: Colors.blueAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                final packageLocation = dropdownValue;
                print(packageLocation);
              });
            },
            items: <String>[
              'Fridge',
              'Freezer',
              'Downstairs Freezer',
              'Stove Cabinet',
              'Spice Rack',
              'Lazy Susan',
              'Pantry',
              'Kitchen Island',
              'Counter'
            ].map<DropdownMenuItem<String>>((String value) {
              // print(value);
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// Product's expiration date.
class ExpirationDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExpirationDate();
  }
}

class _ExpirationDate extends State<ExpirationDate> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateinput,
      decoration: InputDecoration(
        labelText: "Expiration Date?",
        icon: const Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          // print(pickedDate);
          String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
          // print(formattedDate);
          setState(() {
            dateinput.text = formattedDate;
            final productExpDate = dateinput.text;
            print(productExpDate);
          });
        } else {
          print("Date was not selected");
        }
      },
    );
  }
}

// Dropdown for essential products.
class EssentialProductWidget extends StatefulWidget {
  const EssentialProductWidget({Key? key}) : super(key: key);

  @override
  State<EssentialProductWidget> createState() => _EssentialProductWidgetState();
}

class _EssentialProductWidgetState extends State<EssentialProductWidget> {
  String dropdownValue = 'Yes';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 300.0,
          height: 60.0,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Essential Product?',
              icon: const Icon(Icons.production_quantity_limits_rounded),
            ),
          ),
        ),
        SizedBox(
          width: 400.0,
          height: 60.0,
          child: DropdownButton<String>(
            value: dropdownValue,
            iconSize: 20,
            elevation: 16,
            style: const TextStyle(color: Colors.blueGrey),
            underline: Container(
              height: 2,
              color: Colors.blueAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                final isEssential = dropdownValue;
                print(isEssential);
              });
            },
            items: <String>['Yes', 'No']
                .map<DropdownMenuItem<String>>((String value) {
              // print(value);
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// Asks user if the product should be added to grocery list.
class AddGroceryListWidget extends StatefulWidget {
  const AddGroceryListWidget({Key? key}) : super(key: key);

  @override
  State<AddGroceryListWidget> createState() => _AddGroceryListWidgetState();
}

class _AddGroceryListWidgetState extends State<AddGroceryListWidget> {
  String dropdownValue = 'Yes';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 300.0,
          height: 60.0,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Add to Grocery List?',
              icon: const Icon(Icons.shopping_basket),
            ),
          ),
        ),
        SizedBox(
          width: 400.0,
          height: 60.0,
          child: DropdownButton<String>(
            value: dropdownValue,
            iconSize: 20,
            elevation: 16,
            style: const TextStyle(color: Colors.blueGrey),
            underline: Container(
              height: 2,
              color: Colors.blueAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                final addGroceryList = dropdownValue;
                print(addGroceryList);
              });
            },
            items: <String>['Yes', 'No']
                .map<DropdownMenuItem<String>>((String value) {
              // print(value);
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

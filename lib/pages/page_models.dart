import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
    return Row(children: <Widget>[
      SizedBox(
        width: 120.0,
        height: 60.0,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
                  hintText: 'Enter Name', 
                  // border: OutlineInputBorder()
                  ),
          // text box alert
          // onSubmitted: (String value) async {
          //   await showDialog<void>(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return AlertDialog(
          //         title: const Text('Thanks!'),
          //         content: Text(
          //             'You typed "$value", which has length ${value.characters.length}.'),
          //         actions: <Widget>[
          //           TextButton(
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //             child: const Text('OK'),
          //           ),
          //         ],
          //       );
          //     },
          //   );
          // },
        ),
      ),
    ]);
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
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.takeout_dining),
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
        });
      },
      items: <String>['Case', 'Pack', 'Piece', 'Bottle', 'Can']
          .map<DropdownMenuItem<String>>((String value) {
        print(value);
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.place),
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
        });
      },
      items: <String>['Fridge', 'Freezer', 'Downstairs Freezer', 'Stove Cabinet', 'Spice Rack', 'Lazy Susan', 'Pantry', 'Kitchen Island', 'Counter']
          .map<DropdownMenuItem<String>>((String value) {
        print(value);
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.production_quantity_limits),
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
        });
      },
      items:
          <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value) {
        print(value);
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
    return Row(
      children: <Widget>[
        SizedBox(
            width: 140.0,
            height: 60.0,
            child: TextFormField(
              controller: number,
              autocorrect: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  hintText: 'Enter Quantity', 
                  // border: OutlineInputBorder()
                  ),
              maxLength: 3,
            )),
      ],
    );
  }
}

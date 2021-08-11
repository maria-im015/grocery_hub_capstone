import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Name of the item.
class ItemNameWidget extends StatefulWidget {
  const ItemNameWidget({Key? key}) : super(key: key);

  @override
  State<ItemNameWidget> createState() => _ItemNameWidgetState();
}

class _ItemNameWidgetState extends State<ItemNameWidget> {
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
      items: <String>['Case', 'Pack', 'Single', 'Bottle', 'Can']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// Dropdown for essential items.
class EssentialItemWidget extends StatefulWidget {
  const EssentialItemWidget({Key? key}) : super(key: key);

  @override
  State<EssentialItemWidget> createState() => _EssentialItemWidgetState();
}

class _EssentialItemWidgetState extends State<EssentialItemWidget> {
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

import 'package:flutter/material.dart';

// Dropdown menu for type of package.
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
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
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

// Dropdown menu for item location.
class ItemLocationWidget extends StatefulWidget {
  const ItemLocationWidget({Key? key}) : super(key: key);

  @override
  State<ItemLocationWidget> createState() => _ItemLocationWidgetState();
}

class _ItemLocationWidgetState extends State<ItemLocationWidget> {

  String dropdownValue = 'Pack';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.takeout_dining),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
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


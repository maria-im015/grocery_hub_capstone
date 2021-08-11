import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Asks user if the item should be added to grocery list. 
class AddGroceryListWidget extends StatefulWidget {
  const AddGroceryListWidget({Key? key}) : super(key: key);

  @override
  State<AddGroceryListWidget> createState() => _AddGroceryListWidgetState();
}

class _AddGroceryListWidgetState extends State<AddGroceryListWidget> {
  String dropdownValue = 'Yes';

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
      items: <String>['Yes', 'No']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
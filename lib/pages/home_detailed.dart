import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:grocery_hub_capstone/pages/home_args.dart';

// Dropdown menu for item location.
class ItemLocationWidget extends StatefulWidget {
  const ItemLocationWidget({Key? key}) : super(key: key);

  @override
  State<ItemLocationWidget> createState() => _ItemLocationWidgetState();
}

class _ItemLocationWidgetState extends State<ItemLocationWidget> {
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
      items: <String>['Fridge', 'Freezer', 'Pantry', 'Cabinet', 'Counter']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// Item's expiration date.
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
    return Row(
      children: <Widget>[
      SizedBox(
          width: 120.0,
          height: 60.0,
          child: TextField(
            controller: dateinput,
            decoration: InputDecoration(
              labelText: "Enter Date: ",
              icon: Icon(Icons.calendar_today),
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
                String formattedDate =
                    DateFormat('MM-dd-yyyy').format(pickedDate);
                // print(formattedDate);
                setState(() {
                  dateinput.text = formattedDate;
                });
              } else {
                print("Date was not selected");
              }
            },
          ))
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:grocery_hub_capstone/pages/home_args.dart';

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

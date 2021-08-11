import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:grocery_hub_capstone/pages/home_args.dart';

// Dropdown menu for type of pacckage
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
  String dropdownValue = 'Fridge';

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

class ExpirationDate extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ExpirationDate();
  }
}

class _ExpirationDate extends State<ExpirationDate>{
  TextEditingController dateinput = TextEditingController(); 
  //text editing controller for text field
  
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        // appBar: AppBar(
        //     title:Text("DatePicker on TextField"), 
        //     backgroundColor: Colors.redAccent, //background color of app bar
        // ),
        // body:Container(
        //   padding: EdgeInsets.all(15),
        //   height:150,
          children: <Widget> [
            SizedBox(width:120.0, height:60.0,
            child:TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration( 
                   icon: Icon(Icons.calendar_today), //icon of text field
                   labelText: "Enter Date" //label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                         dateinput.text = formattedDate; //set output date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
            )
          )
          ]
    );
  }
}


// class ExpirationDate extends StatefulWidget {
//   const ExpirationDate({Key? key}) : super(key: key);

//   @override
//   _ExpirationDateState createState() => _ExpirationDateState();
// }

// class _ExpirationDateState extends State<ExpirationDate> {
//   ExpirationDateArgs expirationDateArgs = new ExpirationDateArgs(date: '');
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _dateController = TextEditingController();
//   DateTime selectedDate = DateTime.now();

//   _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2019, 8),
//         lastDate: DateTime(2100));
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//         var date =
//             "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
//         _dateController.text = date;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,

//           child: ListView(
            
//             children: [
//               Column(
                
//                 children: [
//                   GestureDetector(
//                     onTap: () => _selectDate(context),
//                     child: AbsorbPointer(
//                       child: Expanded(
//                       child: TextFormField(
//                         onSaved: (val) {
//                           expirationDateArgs.date = selectedDate as String;
//                         },
//                         controller: _dateController,
//                         keyboardType: TextInputType.datetime,
//                         decoration: InputDecoration(
//                           labelText: "Date",
//                           icon: Icon(Icons.calendar_today),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty)
//                             return "Please enter a date for your task";
//                           return null;
//                         },
//                       ),
//                     ),
//                     ),
//                   ),
//                   TextButton(
//                     child: Text("Submit"),
//                     // textColor: Colors.white,
//                     // color: Colors.blueAccent,
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         _formKey.currentState!.save();
//                       }
//                     },
//                   )
//                 ],
//               )
//             ],
//           ),
//     );
//   }
// }

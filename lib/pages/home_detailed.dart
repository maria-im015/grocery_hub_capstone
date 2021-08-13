import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_hub_capstone/pages/page_models.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:grocery_hub_capstone/pages/home_args.dart';

// import 'package:intl/date_symbol_data_local.dart';
// import 'package:grocery_hub_capstone/pages/home_args.dart';

// Product's expiration date. >> KEEP <<
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
    return Row(children: <Widget>[
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
                  print(dateinput.text);
                });
              } else {
                print("Date was not selected");
              }
            },
          ))
    ]);
  }
}

// new
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // final TextEditingController _controller = TextEditingController();
  // Future<Product>? _futureProduct;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'What is the Product\'s name?',
                  hintText: 'Enter Name',
                ),
                // icon: Icon(Icons.phone_iphone)),
                validator: (value) {
                  if (value!.isEmpty) {
                    
                    return 'Please enter the name';
                  }
                  print(value);
                  return null;
                },
              ),


              PackageTypeWidget(),


              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 3,
                decoration: InputDecoration(
                    labelText: 'What is the quantity?',
                    hintText: 'Enter Quantity',
                    icon: Icon(Icons.phone_iphone)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the quantity';
                  }
                  print(value);
                  return null;
                },
              ),
              ExpirationDate(),
              
              EssentialProductWidget(),

              // TextFormField(
              //   keyboardType: TextInputType.number,
              //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              //   maxLength: 10,
              //   decoration: InputDecoration(
              //       labelText: "Enter Your Mobile Number",
              //       hintText: "Number",
              //       icon: Icon(Icons.phone_iphone)),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter some value';
              //     }
              //     if (value.length < 10) {
              //       return 'Please Enter 10 digit number';
              //     }
              //     return null;
              //   },
              // ),
              // // onSaved: (String value){contactNumber=value;},
              // TextFormField(
              //   // onSaved: (String value){pin=value;},
              //   keyboardType: TextInputType.phone,
              //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              //   maxLength: 10,
              //   decoration: InputDecoration(
              //       labelText: "Enter Your PIN",
              //       hintText: "Number",
              //       icon: Icon(Icons.lock)),
              //   validator: (value) {
              //     if (value!.isEmpty || value.length < 6) {
              //       return 'Please Enter 6 digit PIN';
              //     }
              //     return null;
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item Created!')),
      );
    }
                    // final FormState? formState = _formKey.currentState;
                    // if (formState!.validate()) {
                      
                    //   formState.save();
                    //   print(formState);
                    // }
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

// Scaffold.of(context)
//     // ignore: deprecated_member_use
//     .showSnackBar(SnackBar(content: const Text('Processing Data')));

//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: <Widget>[

//     SizedBox(
//       width: 120.0,
//       height: 80.0,
//       child: (_futureProduct == null) ? buildColumn() : buildFutureBuilder(),
//     ),
//   ]);
// }

//   Column buildColumn() {
//     return Column(
//       children: <Widget>[
//           TextField(
//             controller: _controller,
//             decoration: const InputDecoration(hintText: 'Enter Name'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 _futureProduct = createProduct(_controller.text);
//               });
//             },  child: Text('Enter', textAlign: TextAlign.end,),),
//       ],
//     );
//   }

//   FutureBuilder<Product> buildFutureBuilder() {
//     return FutureBuilder<Product>(
//       future: _futureProduct,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           print(snapshot.data!.name);
//           return Text(snapshot.data!.name);
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//         return const LinearProgressIndicator();
//       },
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Row(children: <Widget>[
//     SizedBox(
//       width: 120.0,
//       height: 80.0,
//       child: (_futureProduct == null) ? buildColumn() : buildFutureBuilder(),
//     ),
//   ]);
// }

// Column buildColumn() {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: <Widget>[
//       // SizedBox(
//       //   width: 120.0,
//       //   height: 60.0,
//         // child:
//         TextField(
//           controller: _controller,
//           decoration: const InputDecoration(hintText: 'Enter Name'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _futureProduct = createProduct(_controller.text);
//             });
//           }, child: const Text('Enter'),),
//         // ),

//       // Expanded(
//       //   child: Center(
//       //   child: ElevatedButton(
//       //     onPressed: () {
//       //       setState(() {
//       //         _futureProduct = createProduct(_controller.text);
//       //       });
//       //     }, child: const Text('Enter'),),),),
//       // Expanded(
//       //   child: Center(
//       //     child: const Text('Create Data'),
//       // ),),

//     ],
//   );
// }

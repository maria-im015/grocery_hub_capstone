import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:grocery_hub_capstone/pages/home_args.dart';

// import 'package:intl/date_symbol_data_local.dart';
// import 'package:grocery_hub_capstone/pages/home_args.dart';

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
  final TextEditingController _controller = TextEditingController();
  Future<Product>? _futureProduct;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      
      SizedBox(
        width: 120.0,
        height: 80.0,
        child: (_futureProduct == null) ? buildColumn() : buildFutureBuilder(),
      ),
    ]);
  }

  Column buildColumn() {
    return Column(
      children: <Widget>[
          TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter Name'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _futureProduct = createProduct(_controller.text);
              });
            },  child: Text('Enter', textAlign: TextAlign.end,),),
      ],
    );
  }

  FutureBuilder<Product> buildFutureBuilder() {
    return FutureBuilder<Product>(
      future: _futureProduct,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data!.name);
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const LinearProgressIndicator();
      },
    );
  }
}


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
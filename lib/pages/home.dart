import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';
import 'package:grocery_hub_capstone/pages/home_detailed.dart';

// content that loads on the home page

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String _title = 'Grocery Hub - Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuBar(),
        appBar: AppBar(title: const Text(_title)),
        body: Column(children: <Widget>[
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    'Select the type of Package:',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                  ),
                ),
                Container(child: PackageTypeWidget()),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text(
                    'Quantity to be Added:',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                  ),
                ),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text(
                    'Expiration Date:',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                  ),
                ),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text(
                    'Location:',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                  ),
                ),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text(
                    'Essential Item?',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                  ),
                ),
              ]),
        ]));
  }
}
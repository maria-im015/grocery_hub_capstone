import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';
import 'package:grocery_hub_capstone/pages/consume_detailed.dart';
import 'package:grocery_hub_capstone/pages/page_models.dart';

// Content that loads on the consume item page.
class ConsumeItem extends StatelessWidget {
  const ConsumeItem({Key? key}) : super(key: key);

  static const String _title = 'Grocery Hub - Consume Item';

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
                    'Item\'s name: ',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22.0),
                  ),
                ),
                Container(child: ItemNameWidget()),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    'Type of Package:',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22.0),
                  ),
                ),
                Container(child: PackageTypeWidget()),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    'Quantity to be Consumed: ',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22.0),
                  ),
                ),
                Container(child: QuantityWidget()),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    'Location: ',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22.0),
                  ),
                ),
                Container(child: ItemLocationWidget()),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    'Essential Item? ',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22.0),
                  ),
                ),
                Container(child: EssentialItemWidget()),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    'Add to Grocery List? ',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 22.0),
                  ),
                ),
                Container(child: AddGroceryListWidget()),
              ]),
        ]));
  }
}

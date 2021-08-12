import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/pages/consume.dart';
import 'package:grocery_hub_capstone/pages/grocery_list.dart';
import 'package:grocery_hub_capstone/pages/inventory.dart';
import 'package:grocery_hub_capstone/pages/low_stock.dart';
import 'package:grocery_hub_capstone/pages/home.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 100.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('/images/logo.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Scan Product'),
            onTap: () => {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyHomePage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Consume Product'),
            onTap: () {
              // Navigator.pop(context); takes user back home
              // without pop, user sees menu options
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConsumeProduct()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Current Inventory'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Inventory()));
            },
          ),
          ListTile(
            leading: Icon(Icons.auto_delete),
            title: Text('Low Stock'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => LowStock()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Grocery List'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => GroceryList()));
            },
          ),
        ],
      ),
    );
  }
}

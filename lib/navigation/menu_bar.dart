import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/pages/consume_item.dart';

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
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('/images/logo.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Scan Item'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Consume Item'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConsumeItem()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Current Inventory'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.auto_delete),
            title: Text('Low Stock'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Grocery List'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

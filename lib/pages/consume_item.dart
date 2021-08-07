import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';

// content that loads on the consume item page

class ConsumeItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Consume Item'),
      ),
      body: Container(
        child: Center(
          child: Text('stuff'),
        ),
      ),
    );
  }
}
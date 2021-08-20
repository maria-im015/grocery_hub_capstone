import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_hub_capstone/navigation/menu_bar.dart';
import 'package:grocery_hub_capstone/pages/consume_detailed.dart';
// import 'package:grocery_hub_capstone/pages/page_models.dart';

// Content that loads on the consume page.
class ConsumeProduct extends StatelessWidget {
  const ConsumeProduct({Key? key}) : super(key: key);

  static const String _title = 'Grocery Hub - Consume Product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(title: const Text(_title)),
      body: ConsumeDetailed(),
    );
  }
}

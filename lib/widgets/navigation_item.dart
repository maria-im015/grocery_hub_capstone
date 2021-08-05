import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/routes/routes.dart';
import 'package:grocery_hub_capstone/widgets/interactive_nav_item.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final String routeName;
  final bool selected;
  final Function onHighlight;

  const NavigationItem(
    {Key? key,
    required this.title,
    required this.routeName,
    required this.selected,
    required this.onHighlight,
    })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return GestureDetector(
      
      onTap: () => nav.pushNamed(routeName),
        // onHighlight(routeName);
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: InteractiveNavItem(
          //child: ,
          text: title,
          routeName: routeName,
          selected: selected,
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_hub_capstone/routes/routes.dart';
import 'package:grocery_hub_capstone/ui/about_page.dart';
import 'package:grocery_hub_capstone/ui/contact_page.dart';
import 'package:grocery_hub_capstone/ui/home_page.dart';

class RouteGenerator {
  onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomePage());
        //break;
      case routeAbout:
        return MaterialPageRoute(builder: (_) => AboutPage());
        //break;
      case routeContacts:
        return MaterialPageRoute(builder: (_) => ContactPage());
        //break;
    }
  }
}
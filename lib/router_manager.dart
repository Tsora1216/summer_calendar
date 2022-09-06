import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_calendar/calender_screen.dart';

class Routers {
  static const String calender = "/calender";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routers.calender:
        return MaterialPageRoute(builder: (_) => const CalenderScreen());
      default:
        return MaterialPageRoute(builder: (_) => const CalenderScreen());
    }
  }
}

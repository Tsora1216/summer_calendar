import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_calendar/calender_screen.dart';
import 'package:summer_calendar/text_input.dart';


class Routers {
  static const String calender = "/calender";
  static const String textInput = "/textInput";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routers.calender:
        return MaterialPageRoute(builder: (_) => const CalenderScreen());
      case Routers.textInput:
        return MaterialPageRoute(builder: (_) => const TextInputScreen());
      default:
        return MaterialPageRoute(builder: (_) => const CalenderScreen());
    }
  }
}

import 'package:flutter/material.dart';

class CustomNavigation {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static push(page) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushReplacement(page) {
    Navigator.pushReplacement(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

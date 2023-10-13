import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'navigation.dart';
import 'theme.dart';
import 'views/splash/splash_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC Monitor',
      theme: AppTheme.light(),
      home: const SplashPage(),
      navigatorKey: CustomNavigation.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}

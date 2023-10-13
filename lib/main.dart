import 'package:abc_monitor/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'navigation.dart';
import 'theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppTheme.kScaffoldColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
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

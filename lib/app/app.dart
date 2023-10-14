import 'package:abc_monitor/theme.dart';
import 'package:flutter/material.dart';

import '../navigation.dart';
import 'pages/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agro +',
      theme: AppTheme.light(),
      home: const SplashPage(),
      navigatorKey: CustomNavigation.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}

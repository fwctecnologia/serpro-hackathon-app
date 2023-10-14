import 'package:abc_monitor/theme.dart';
import 'package:abc_monitor/web/pages/destinations_page.dart';
import 'package:abc_monitor/web/pages/home_page.dart';
import 'package:abc_monitor/web/pages/login_page.dart';
import 'package:flutter/material.dart';

class Painel extends StatelessWidget {
  const Painel({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SERPRO ABC+ Painel',
      theme: AppTheme.light().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)
            .copyWith(surface: Colors.white, surfaceTint: Colors.white),
        cardColor: Colors.white,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

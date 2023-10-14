import 'package:abc_monitor/app/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final sController = SplashController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Constants.logotipoAsset,
          scale: 2,
        ),
      ),
    );
  }
}

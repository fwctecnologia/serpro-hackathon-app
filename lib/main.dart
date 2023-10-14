import 'package:abc_monitor/app/app.dart';
import 'package:abc_monitor/web/painel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppTheme.kScaffoldColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));

  if (kIsWeb) {
    return runApp(const Painel());
  }

  runApp(const App());
}

import 'package:abc_monitor/pages/presentation/presentation_page.dart';

import '../../navigation.dart';

class SplashController {
  SplashController() {
    checkAuthStatus();
  }

  void checkAuthStatus() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      CustomNavigation.push(const PresentationPage());
    });
  }
}

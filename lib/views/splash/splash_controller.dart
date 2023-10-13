import '../../navigation.dart';
import '../login/login_page.dart';

class SplashController {
  SplashController() {
    checkAuthStatus();
  }

  void checkAuthStatus() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      CustomNavigation.push(const LoginPage());
    });
  }
}

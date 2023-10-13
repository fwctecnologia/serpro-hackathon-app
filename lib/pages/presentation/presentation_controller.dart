import 'package:abc_monitor/pages/login/login_page.dart';
import '../../navigation.dart';

class PresentationController {
  void goToLoginPage() {
    CustomNavigation.push(const LoginPage());
  }
}

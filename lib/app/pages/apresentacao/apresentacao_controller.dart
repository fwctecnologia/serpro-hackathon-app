import '../../../navigation.dart';
import '../login/login_page.dart';

class PresentationController {
  void goToLoginPage() {
    CustomNavigation.push(const LoginPage());
  }
}

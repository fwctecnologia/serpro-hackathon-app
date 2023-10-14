import 'package:abc_monitor/pages/home/home_page.dart';

import '../../model/user.dart';
import '../../navigation.dart';

class LoginController {
  late User user;
  LoginController() {
    user = User.empty();
  }

  void goToHomePage() {
    CustomNavigation.push(const HomePage());
  }
}

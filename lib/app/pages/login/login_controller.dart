import 'package:abc_monitor/app/pages/home/home_page.dart';

import '../../../model/user.dart';
import '../../../navigation.dart';

class LoginController {
  late User user;
  LoginController() {
    user = User.empty();
  }

  Future<dynamic> goToHomePage() async {
    await Future.delayed(const Duration(seconds: 1));
    CustomNavigation.push(const HomePage());
  }
}

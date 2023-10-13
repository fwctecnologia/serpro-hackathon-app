import '../../model/user.dart';
import '../../navigation.dart';
import '../recovery/recovery_page.dart';
import '../signup/signup_page.dart';

class UserController {
  late User user;
  UserController() {
    user = User.empty();
  }

  void goToSignupPage() {
    CustomNavigation.push(const SignupPage());
  }

  void goToRecoveryPage() {
    CustomNavigation.push(const RecoveryPage());
  }
}

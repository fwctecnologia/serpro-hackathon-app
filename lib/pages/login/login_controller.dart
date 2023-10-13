import 'package:abc_monitor/pages/apresentacao/apresentacao_page.dart';

import '../../model/user.dart';
import '../../navigation.dart';

class LoginController {
  late User user;
  LoginController() {
    user = User.empty();
  }

  void goToApresentacaoPage() {
    CustomNavigation.push(const ApresentacaoPage());
  }
}

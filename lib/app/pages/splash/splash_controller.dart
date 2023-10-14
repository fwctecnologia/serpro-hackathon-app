import '../../../navigation.dart';
import '../apresentacao/apresentacao_page.dart';

class SplashController {
  SplashController() {
    checkAuthStatus();
  }

  void checkAuthStatus() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      CustomNavigation.push(const ApresentacaoPage());
    });
  }
}

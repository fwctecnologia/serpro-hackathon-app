import 'package:abc_monitor/app/pages/noticias/noticias_page.dart';

import '../../../navigation.dart';
import '../documentos/documentos_page.dart';

class HomeController {
  void goToNoticiasPage() {
    CustomNavigation.push(const NoticiasPage());
  }

  void goToDocumentosPage() {
    CustomNavigation.push(const DocumentosPage());
  }
}

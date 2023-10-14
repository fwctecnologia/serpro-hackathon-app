import 'package:abc_monitor/pages/documentos/documentos_page.dart';
import 'package:abc_monitor/pages/noticias/noticias_page.dart';

import '../../navigation.dart';

class HomeController {
  void goToNoticiasPage() {
    CustomNavigation.push(const NoticiasPage());
  }

  void goToDocumentosPage() {
    CustomNavigation.push(const DocumentosPage());
  }
}

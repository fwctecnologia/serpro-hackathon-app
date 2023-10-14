import '../documentos/documentos_page.dart';
import '../noticias/noticias_page.dart';
import '../../../navigation.dart';
import '../pastagem/pastagem_page.dart';

class HomeController {
  void goToNoticiasPage() {
    CustomNavigation.push(const NoticiasPage());
  }

  void goToDocumentosPage() {
    CustomNavigation.push(const DocumentosPage());
  }

  void goToPastagemPage() {
    CustomNavigation.push(const PastagemPage());
  }
}

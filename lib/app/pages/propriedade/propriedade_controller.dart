import 'package:abc_monitor/app/pages/noticias/noticias_page.dart';
import 'package:abc_monitor/model/propriedade.dart';

import '../../../navigation.dart';
import '../documentos/documentos_page.dart';

class PropriedadeController {
  final List<Propriedade> data = [
    Propriedade(
      nome: "Fazenda do João",
      cidade: "São Paulo",
      estado: "SP",
      atividades: ["Café", "Milho"],
      praticasAbc: 2,
      hectares: 100,
      porcentagemAreaVerde: 50,
    ),
    Propriedade(
      nome: "Sítio da Maria",
      cidade: "Rio de Janeiro",
      estado: "RJ",
      atividades: ["Mandioca", "Banana"],
      praticasAbc: 3,
      hectares: 70,
      porcentagemAreaVerde: 60,
    ),
    Propriedade(
      nome: "Chácara do Pedro",
      cidade: "Salvador",
      estado: "BA",
      atividades: ["Cacau", "Pimenta"],
      praticasAbc: 2,
      hectares: 90,
      porcentagemAreaVerde: 55,
    ),
    Propriedade(
      nome: "Sítio da Ana",
      cidade: "Fortaleza",
      estado: "CE",
      atividades: ["Manga", "Abacaxi"],
      praticasAbc: 3,
      hectares: 60,
      porcentagemAreaVerde: 70,
    ),
  ];

  Future<dynamic> getPropriedades() async {
    await Future.delayed(const Duration(seconds: 1));
    return data;
  }

  void goToNoticiasPage() {
    CustomNavigation.push(const NoticiasPage());
  }

  void goToDocumentosPage() {
    CustomNavigation.push(const DocumentosPage());
  }
}

import 'package:abc_monitor/web/tables/arquivo_table.dart';
import 'package:abc_monitor/web/tables/noticias_table.dart';
import 'package:abc_monitor/web/tables/notification_table.dart';
import 'package:flutter/material.dart';

class NoticiasDestination extends StatefulWidget {
  const NoticiasDestination({Key? key}) : super(key: key);

  @override
  State<NoticiasDestination> createState() => _NoticiasDestinationState();
}

class _NoticiasDestinationState extends State<NoticiasDestination> {
  List<Map> noticias = [
    {
      "titulo":
          "Conheça a fazenda que é referência em engorda intensiva de gado",
      "descricao":
          "Não faz muito tempo que o Vale do Araguaia ganhou destaque nacional pela alta produtividade na criação de gado e na agricultura. A região, que já foi chamada de “Vale dos Esquecidos”, hoje é conhecida como o novo celeiro do agro no país.",
      "enviado_em": DateTime.now()
          .subtract(const Duration(days: 2, hours: 5, minutes: 2, seconds: 6)),
    },
    {
      "titulo":
          "Setembro de alta no mercado do boi gordo e de boas expectativas adiante",
      "descricao":
          "Desde a segunda semana de setembro, os preços começaram a reagir, puxados, principalmente, pela melhora no escoamento de carne bovina nas prateleiras, pelo bom volume de carne bovina in natura exportado e pela redução na oferta de bovinos destinados ao abate.",
      "enviado_em": DateTime.now()
          .subtract(const Duration(days: 2, hours: 5, minutes: 2, seconds: 6)),
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add_comment),
        label: const Text("Nova Noticia"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 24, bottom: 10, top: 20, left: 24),
            child: Text(
              "Gerenciar Noticias",
              style: TextStyle(fontSize: 30),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Row(
          //     children: [
          //       ElevatedButton.icon(
          //         icon: const Icon(Icons.person_add_alt_1_outlined),
          //         onPressed: () async {},
          //         label: const Text("Adicionar"),
          //       ),
          //     ],
          //   ),
          // ),
          NoticiasTable(
            noticias: noticias,
            onDelete: (notificacao) async {},
            onReSend: (notificacao) async {},
          ),
        ],
      ),
    );
  }
}

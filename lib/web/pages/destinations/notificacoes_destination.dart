import 'package:abc_monitor/web/tables/notification_table.dart';
import 'package:flutter/material.dart';

class NotificacoesDestination extends StatefulWidget {
  const NotificacoesDestination({Key? key}) : super(key: key);

  @override
  State<NotificacoesDestination> createState() =>
      _NotificacoesDestinationState();
}

class _NotificacoesDestinationState extends State<NotificacoesDestination> {
  List<Map> notificacoes = [
    {
      "titulo": "Alerta de Geada",
      "descricao":
          "Previsão de geada para esta noite. Proteja suas plantas sensíveis.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Chuva Esperada",
      "descricao": "Chuva prevista para amanhã. Não é necessário irrigação.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Praga Identificada",
      "descricao":
          "Identificamos sinais de uma praga em sua plantação. Consulte nosso guia de controle de pragas.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Alerta de Tempestade",
      "descricao":
          "Alerta de tempestade severa prevista para a região. Proteja sua safra e equipamentos.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Atualização de Preços",
      "descricao":
          "Os preços de produtos agrícolas aumentaram. Considere vender sua safra.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Dica de Fertilizante",
      "descricao":
          "Recomendamos o uso de um novo fertilizante para aumentar a produtividade. Saiba mais em nosso blog.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Manutenção de Equipamentos",
      "descricao":
          "Lembre-se de agendar a manutenção de seus tratores e maquinário agrícola.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Feira Agrícola Local",
      "descricao":
          "Participe da feira agrícola local no próximo fim de semana para aprender sobre novas tecnologias e práticas agrícolas.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Condições de Solo",
      "descricao":
          "As condições do solo estão ótimas para o plantio. Aproveite a oportunidade para iniciar a semeadura.",
      "enviado_em": DateTime.now(),
    },
    {
      "titulo": "Lembrete de Colheita",
      "descricao":
          "A data de colheita de suas culturas de outono está se aproximando. Esteja preparado.",
      "enviado_em": DateTime.now(),
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
        icon: const Icon(Icons.notification_add),
        label: const Text("Nova Notificação"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 24, bottom: 10, top: 20, left: 24),
            child: Text(
              "Gerenciar Notificações",
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
          NotificacoesTable(
            notificacoes: notificacoes,
            onDelete: (notificacao) async {},
            onReSend: (notificacao) async {},
          ),
        ],
      ),
    );
  }
}

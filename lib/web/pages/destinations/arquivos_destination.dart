import 'package:abc_monitor/web/tables/arquivo_table.dart';
import 'package:abc_monitor/web/tables/notification_table.dart';
import 'package:flutter/material.dart';

class ArquivosDestination extends StatefulWidget {
  const ArquivosDestination({Key? key}) : super(key: key);

  @override
  State<ArquivosDestination> createState() => _ArquivosDestinationState();
}

class _ArquivosDestinationState extends State<ArquivosDestination> {
  List<Map> arquivos = [
    {
      "nome": "Manual_usuario_assinador_desktop.pdf",
      "formato": "Documento",
      "enviado_em": DateTime.now()
          .subtract(const Duration(days: 43, hours: 5, minutes: 2, seconds: 6)),
    },
    {
      "nome": "Mapa Mural do Brasil – 2022.pdf",
      "formato": "Documento",
      "enviado_em": DateTime.now()
          .subtract(const Duration(days: 52, hours: 4, minutes: 3, seconds: 7)),
    },
    {
      "nome": "Disponibilização de crédito de carbono 2023.pdf",
      "formato": "Documento",
      "enviado_em": DateTime.now()
          .subtract(const Duration(days: 64, hours: 7, minutes: 6, seconds: 3)),
    },
    {
      "nome": "Ata de reunião cooperativa .pdf",
      "formato": "Documento",
      "enviado_em": DateTime.now().subtract(
          const Duration(days: 68, hours: 3, minutes: 21, seconds: 26)),
    },
    {
      "nome": "foto grupo coperativa 2023.jpg",
      "formato": "Foto",
      "enviado_em": DateTime.now().subtract(
          const Duration(days: 72, hours: 8, minutes: 6, seconds: 45)),
    }
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
        icon: const Icon(Icons.upload),
        label: const Text("Novo Arquivo"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 24, bottom: 10, top: 20, left: 24),
            child: Text(
              "Gerenciar Arquivos",
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
          ArquivoTable(
            arquivos: arquivos,
            onDelete: (notificacao) async {},
            onReSend: (notificacao) async {},
          ),
        ],
      ),
    );
  }
}

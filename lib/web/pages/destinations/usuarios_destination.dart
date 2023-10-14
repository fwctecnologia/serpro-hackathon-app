import 'package:abc_monitor/web/tables/arquivo_table.dart';
import 'package:abc_monitor/web/tables/notification_table.dart';
import 'package:abc_monitor/web/tables/usuarios_table.dart';
import 'package:flutter/material.dart';

class UsuariosDestination extends StatefulWidget {
  const UsuariosDestination({Key? key}) : super(key: key);

  @override
  State<UsuariosDestination> createState() => _UsuariosDestinationState();
}

class _UsuariosDestinationState extends State<UsuariosDestination> {
  List<Map> usuarios = [
    {
      "nome": "Paulo Francisco",
      "area": "Fazenda Paulo Francisco",
      "entrou_em": DateTime.now()
          .subtract(const Duration(days: 43, hours: 5, minutes: 2, seconds: 6)),
    },
    {
      "nome": "Carlos José",
      "area": "Jardim Carlos José",
      "entrou_em": DateTime.now()
          .subtract(const Duration(days: 41, hours: 3, minutes: 2, seconds: 6)),
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
        icon: const Icon(Icons.person),
        label: const Text("Novo Usuário"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 24, bottom: 10, top: 20, left: 24),
            child: Text(
              "Gerenciar Usuários",
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
          UsuariosTable(
            usuarios: usuarios,
            onDelete: (notificacao) async {},
            onReSend: (notificacao) async {},
          ),
        ],
      ),
    );
  }
}

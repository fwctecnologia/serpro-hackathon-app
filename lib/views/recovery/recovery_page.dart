import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/textformfield_widget.dart';
import '../login/login_controller.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({Key? key}) : super(key: key);

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  bool checked = false;
  final uController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Recuperação de senha'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informe os seus dados nos campos abaixo para receber um link de redefinição de senha.",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Container(height: 20),
              Text(
                "CPF",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              const CustomTextFormField(
                hintText: "Informe o seu CPF",
              ),
              Container(height: 10),
              Text(
                "Senha",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(height: 5),
              const CustomTextFormField(
                hintText: "Informe a sua senha",
              ),
              Container(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("ENVIAR"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/textformfield_widget.dart';
import '../login/login_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool checked = false;
  final uController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Cadastro'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informe os seus dados nos campos abaixo para realizar o cadastro.",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Container(height: 20),
              Text(
                "Nome",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              const CustomTextFormField(
                hintText: "Informe o seu nome",
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Data de Nascimento",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        const CustomTextFormField(
                          hintText: "00/00/0000",
                        ),
                      ],
                    ),
                  ),
                  Container(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sexo",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            genderButton(
                              text: "M",
                              selected: uController.user.sexo == "masculino",
                              onPressed: () {
                                uController.user.sexo = "masculino";
                                setState(() {});
                              },
                            ),
                            Container(width: 5),
                            genderButton(
                              text: "F",
                              selected: uController.user.sexo == "feminino",
                              onPressed: () {
                                uController.user.sexo = "feminino";
                                setState(() {});
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(height: 10),
              Text(
                "CPF",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(height: 5),
              const CustomTextFormField(
                hintText: "Informe o seu CPF",
              ),
              Container(height: 10),
              Text(
                "Celular",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(height: 5),
              const CustomTextFormField(
                hintText: "(00) 00000-0000",
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
                hintText: "Informe a senha",
              ),
              Container(height: 10),
              Text(
                "Confirmação de senha",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(height: 5),
              const CustomTextFormField(
                hintText: "Informe novamente a sua senha",
              ),
              Container(height: 10),
              Row(
                children: [
                  SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      visualDensity: VisualDensity.compact,
                      value: checked,
                      onChanged: (value) {
                        checked = value!;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(width: 5),
                  Text(
                    "Aceito os termos de uso e a política de privacidade",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ],
              ),
              Container(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("CADASTRAR"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget genderButton({
  required String text,
  required VoidCallback onPressed,
  bool selected = false,
}) {
  final foregroundColor = selected ? AppTheme.kDefaultColor : AppTheme.kBlack;
  final borderColor =
      selected ? AppTheme.kDefaultColor : Colors.black.withOpacity(0.2);
  return SizedBox(
    width: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: foregroundColor,
        side: BorderSide(
          color: borderColor,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    ),
  );
}

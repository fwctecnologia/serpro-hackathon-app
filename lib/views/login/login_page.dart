import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../theme.dart';
import '../../widgets/textformfield_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final lController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    Constants.logotipoAssetUrl,
                    scale: 2,
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
                Text(
                  "Senha",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                const CustomTextFormField(
                  hintText: "Informe a sua senha",
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => lController.goToRecoveryPage(),
                    child: Text("Esqueci minha senha",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppTheme.kBlueDefault,
                            )),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: const Text('LOGIN'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.kBlueRoyal,
                      side: const BorderSide(
                        color: AppTheme.kBlueRoyal,
                      ),
                    ),
                    onPressed: () => lController.goToSignupPage(),
                    child: const Text('CRIAR CONTA'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

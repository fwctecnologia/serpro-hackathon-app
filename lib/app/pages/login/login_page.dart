import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../theme.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final lController = LoginController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Image.asset(
                  Constants.presentationHomeAsset,
                ),
              ),
              presentationContent(),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.kLightGreen,
                      side: const BorderSide(
                        color: AppTheme.kDefaultColor,
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      loading = true;
                      setState(() {});
                      lController.goToHomePage().then((value) {
                        loading = false;
                        setState(() {});
                      });
                    },
                    child: loading
                        ? const CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Entrar com',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                              Container(width: 5),
                              Image.asset(
                                Constants.logotipoGovBrAsset,
                                scale: 23.7,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget presentationContent() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Utilize o",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.kDarkGreen,
                  fontSize: 22),
            ),
            Container(width: 5),
            Image.asset(
              Constants.logotipoGovBrAsset,
              scale: 18.7,
            ),
            Container(width: 5),
            Text(
              "para ter",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.kDarkGreen,
                  fontSize: 22),
            ),
          ],
        ),
        Center(
          child: Text(
            "acesso aos benefícios",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.kDarkGreen,
                fontSize: 22),
          ),
        ),
      ],
    );
  }
}

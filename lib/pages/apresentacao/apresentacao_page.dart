import 'package:abc_monitor/navigation.dart';
import 'package:abc_monitor/pages/trilha/trilha_page.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'apresentacao_controller.dart';

class ApresentacaoPage extends StatefulWidget {
  const ApresentacaoPage({Key? key}) : super(key: key);

  @override
  State<ApresentacaoPage> createState() => _ApresentacaoPageState();
}

class _ApresentacaoPageState extends State<ApresentacaoPage> {
  final controller = PresentationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Constants.presentationFarmerAsset,
                scale: 1,
              ),
              Container(height: 30),
              Text("Produza +\nCom ABC+",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Container(height: 30),
                    Text(
                      "Produza mais e de forma mais\n  sustentável com práticas consolidadas\n e com muitos benefícios",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Container(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          CustomNavigation.push(const TrilhaPage());
                        },
                        child: const Text("Conheça o ABC+"),
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.goToLoginPage(),
                      child: Text(
                        "Fazer login",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

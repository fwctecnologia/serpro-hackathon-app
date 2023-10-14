import 'package:abc_monitor/pages/cadastrar_propriedade/cadastrar_propriedade_screen.dart';
import 'package:abc_monitor/theme.dart';
import 'package:abc_monitor/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(
        page: BottomBarPage.home,
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Olá, ",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppTheme.kDarkGreen),
              ),
              TextSpan(
                text: "João da Roça",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () => controller.goToNoticiasPage(),
            child: Image.asset(Constants.sininhoAsset),
          ),
          InkWell(
            onTap: () => controller.goToPastagemPage(),
            child: Image.asset(Constants.sininhoAsset),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () => controller.goToDocumentosPage(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.kDefaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6822A),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Emissão de CO2 10/23 ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    Text(
                                      '207 Ton.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Meta do mês',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.white,
                                        )),
                                Text(
                                  '207 Ton',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ver histórico de emissão',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 10),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

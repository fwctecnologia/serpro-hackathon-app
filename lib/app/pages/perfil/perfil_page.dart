import 'package:abc_monitor/theme.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  List<dynamic> docs = [
    [
      true,
      Constants.p1Asset,
      "Agricultor Orgânico",
      RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: "Produza de forma orgânica em ",
          style: TextStyle(
            color: AppTheme.kDarkGreen,
            fontSize: 10,
          ),
          children: [
            TextSpan(
              text: "8 hectares",
              style: TextStyle(
                color: AppTheme.kDarkGreen,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      1.8,
    ],
    [
      false,
      Constants.p2Asset,
      "Guardião da Floresta",
      RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: "Preserve",
          style: TextStyle(
            color: AppTheme.kDarkGreen,
            fontSize: 10,
          ),
          children: [
            TextSpan(
              text: " 75% ",
              style: TextStyle(
                color: AppTheme.kDarkGreen,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            TextSpan(
              text: "da área de mata nativa em sua propriedade",
              style: TextStyle(
                color: AppTheme.kDarkGreen,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      1.5,
    ],
    [
      false,
      Constants.p3Asset,
      "Inimigo do desperdício",
      RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: "Utilize os dejetos animais para produzir adubo e bio gás ",
          style: TextStyle(
            color: AppTheme.kDarkGreen,
            fontSize: 10,
          ),
        ),
      ),
      1.5,
    ],
    [
      true,
      Constants.p4Asset,
      "Pecuarista Responsável",
      RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: "Recupere ",
          style: TextStyle(
            color: AppTheme.kDarkGreen,
            fontSize: 10,
          ),
          children: [
            TextSpan(
              text: " 5 hectares ",
              style: TextStyle(
                color: AppTheme.kDarkGreen,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            TextSpan(
              text: " de pasto degradado",
              style: TextStyle(
                color: AppTheme.kDarkGreen,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      1.5,
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        forceMaterialTransparency: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(Constants.sininhoAsset),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(Constants.personCircleAsset),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppTheme.kDarkGreen,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Suas Conquistas",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppTheme.kDarkGreen,
                      ),
                    )
                  ],
                ),
              ),
              Container(height: 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "28% Concluído",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.72),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppTheme.kDefaultColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: [
                    ...docs
                        .map((e) => card(e[0], e[1], e[2], e[3], e[4]))
                        .toList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget card(bool finalizado, String imageAsset, String titulo, Widget child,
      double scale) {
    return Card(
      color: Color(0xffD1E7DD),
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            finalizado
                ? Text(
                    "Conquista obtida",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.kDarkGreen,
                        ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.only(right: 120),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppTheme.kDefaultColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
            Image.asset(
              imageAsset,
              width: 90,
              height: 90,
            ),
            Text(
              titulo,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Container(height: 10),
            child
          ],
        ),
      ),
    );
  }
}

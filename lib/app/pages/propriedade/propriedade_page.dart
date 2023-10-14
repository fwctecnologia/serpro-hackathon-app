import 'package:abc_monitor/theme.dart';
import 'package:abc_monitor/widgets/card_propriedade_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/propriedade.dart';
import 'propriedade_controller.dart';

class PropriedadePage extends StatefulWidget {
  const PropriedadePage({Key? key}) : super(key: key);

  @override
  State<PropriedadePage> createState() => _PropriedadePageState();
}

class _PropriedadePageState extends State<PropriedadePage> {
  final List<Propriedade> propriedades = [];
  final controller = PropriedadeController();

  Color getColor(int areaVerde) {
    if (areaVerde >= 70) {
      return Constants.coresIndicadoras[0];
    } else if (areaVerde >= 50) {
      return Constants.coresIndicadoras[1];
    } else {
      return Constants.coresIndicadoras[2];
    }
  }

  @override
  void initState() {
    super.initState();
    controller.getPropriedades().then((value) => {
          propriedades.addAll(value),
          setState(() {}),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Minhas Propriedades'),
        leading: Image.asset(
          Constants.personAsset,
        ),
        actions: [
          InkWell(
            onTap: () => controller.goToNoticiasPage(),
            child: Image.asset(Constants.sininhoAsset),
          ),
        ],
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.kDefaultColor,
          ),
          onPressed: () {},
          child: const Text('Cadastrar Propriedade'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            propriedades.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ...propriedades
                          .map(
                            (e) => CardPropriedadeWidget(
                              function: () {
                                //     controller.goToPropriedadeDetalhesPage(e);
                              },
                              p: e,
                              color: getColor(e.porcentagemAreaVerde),
                            ),
                          )
                          .toList(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
